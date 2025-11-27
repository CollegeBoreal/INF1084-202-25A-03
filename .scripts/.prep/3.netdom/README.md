# 🙋‍♂️ Trust: using `netdom`

Based on the screenshot you provided, you have created a **trust relationship** between two **Active Directory domains** (or more specifically, two realms, indicating this might be in a mixed or pure Kerberos environment).

Here is a breakdown of what the trust is referring to:

### 1. The Domains Involved
*   **Local Domain (This Domain):** `DC300098957-90.local`
*   **Trusted Domain (Other Domain):** `DC300098957-40.local`

You are looking at the properties of the trust *from the perspective* of the domain `DC300098957-90.local`.

### 2. Key Properties of the Trust You Created

*   **Trust Type: Realm**
    This strongly suggests that at least one side of this trust is a non-Windows domain that uses Kerberos for authentication (like a UNIX realm managed by MIT Kerberos or Heimdal). A "Realm" trust is used to connect a Windows Active Directory domain to a Kerberos realm.

*   **Direction: Two-Way**
    This is a bidirectional trust.
    *   Users in `DC300098957-90.local` can access resources in `DC300098957-40.local`.
    *   Users in `DC300098957-40.local` can access resources in `DC300098957-90.local`.

*   **Encryption Type:**
    The checkbox **"The other domain supports Kerberos AES Encryption"** is **unchecked**. This means that the trusted domain (`DC300098957-40.local`) does not support the stronger AES encryption for Kerberos tickets. It will likely use older encryption types like RC4.

*   **Transitivity:**
    The transitivity is not selected in the screenshot, but the options are:
    *   **Transitive:** If enabled, trust would extend to other domains that are trusted by `DC300098957-40.local`.
    *   **Non-Transitive:** Trust is **strictly limited** to the two domains directly involved (`DC300098957-90.local` and `DC300098957-40.local`). This is the more secure and common configuration for realm trusts with external, non-Windows Kerberos realms.

---

### In Simple Terms:

You have built a bridge between two separate security domains:
*   **Domain A:** `DC300098957-90.local`
*   **Domain B:** `DC300098957-40.local` (which appears to be a non-Windows Kerberos realm)

Because the trust is **Two-Way**, users from either side can be granted permission to use files, applications, or services (like logging in to a computer) on the other side. This is a fundamental mechanism for enabling single sign-on and resource sharing across different network environments.

## :two: How do I test it?

Excellent question. Testing the trust is crucial to ensure it's working correctly. Here are several methods to test the trust relationship you've created, ranging from simple to advanced.

Since you have a **two-way realm trust**, you can test from both directions. I'll assume you are testing from a Windows machine/domain controller in the `DC300098957-90.local` domain.

---

### Method 1: Basic Network Test (Quick Check)

This uses the standard `net` command to view and test the trust.

1.  **Open Command Prompt** as an Administrator.
2.  **View the trust** to confirm it's listed correctly:
    ```cmd
    nltest /domain_trusts /all_trusts
    ```
    Look for `DC300098957-40.local` in the output. The `nltest` tool provides detailed, low-level information about the trust.

3.  **Test the trust** directly. This is the most straightforward test:
    ```cmd
    nltest /trusted_domains
    ```
    This will list all domains trusted by your current domain. You should see `DC300098957-40.local`.

---

### Method 2: Active Directory Users and Computers (Graphical Test)

This method simulates looking up a user from the trusted domain.

1.  Open **Active Directory Users and Computers**.
2.  Right-click on your domain (`DC300098957-90.local`) and select **Find...**.
3.  In the "Find" drop-down menu, change it from "Users, Contacts, and Groups" to **"External Trust Security Principals"**. (For a realm trust, this is the correct location).
4.  Click **Find Now**.
    *   **Success:** If the trust is working, it will successfully query the trusted realm and display a list of users and groups from `DC300098957-40.local`.
    *   **Failure:** If the trust is broken, you will get an error message like "The following error occurred during the search: The remote procedure call failed."

---

### Method 3: The "net use" Command (Functional Test)

This is a more realistic test that attempts to authenticate using the trust. You will need a **valid username and password** from the trusted domain (`DC300098957-40.local`).

**Syntax:**
```cmd
net use \\<Server_in_90.domain>\<Share> /user:DC300098957-40\<username> <password>
```

**Example:**
Let's say you have a file server in your local domain named `FILESERVER01` with a shared folder `Data`, and a user in the trusted realm named `testuser`.

```cmd
net use \\FILESERVER01\Data /user:DC300098957-40\testuser *
```
(The `*` will prompt you to enter the password securely. You can put the password directly in the command, but this is less secure).

**Interpretation:**
*   **Success:** The command returns "The command completed successfully." This proves authentication across the trust worked.
*   **Failure:** You will get an error like "System error 1326 has occurred: Logon failure: unknown user name or bad password." (Double-check the username/password) or "The trust relationship between this workstation and the primary domain failed." (Indicates a problem with the trust itself).

---

### Method 4: Kerberos-Specific Tools (Advanced)

Since this is a **realm trust**, using Kerberos tools is very appropriate.

1.  **Request a Ticket-Granting-Ticket (TGT) for the foreign realm:**
    Use `klist` to see your current Kerberos tickets. Then, use `kinit` to get a ticket for a user in the other realm.

    ```cmd
    # First, purge your current tickets to start fresh (optional)
    klist purge

    # Request a TGT for a user in the trusted realm
    kinit username@DC300098957-40.LOCAL
    ```
    You will be prompted for the user's password.

2.  **Verify the ticket was granted:**
    ```cmd
    klist
    ```
    **Success:** You will see a Kerberos ticket for `krbtgt/DC300098957-40.LOCAL@DC300098957-40.LOCAL` or similar. This is definitive proof that the Kerberos trust is functioning.

---

### Recommended Testing Strategy

1.  Start with **Method 1** (`nltest`) for a quick health check.
2.  Then, use **Method 2** (Find in AD) to confirm the directory connection works without needing credentials.
3.  Finally, for a full functional test, use **Method 3** (`net use`) or **Method 4** (`kinit`) with a real username and password from the `DC300098957-40.local` realm.

By using a combination of these methods, you can be confident that your two-way realm trust is fully operational. Remember, you can and should also test from the other direction (`DC300098957-40.local` to `DC300098957-90.local`).
