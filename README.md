
# Multi-Layered Access Control with IAM Permission Boundaries and SCPs

### Overview

In this repository, **we're implementing a multi-layered security approach** using **IAM Permission Boundaries** and **Service Control Policies (SCPs)**. **Our goal** is to prevent privilege escalation by ensuring that even if admins or project leads have elevated access, **they can't create roles or users** with unrestricted admin permissions. This keeps the security posture strong and ensures controlled access.

### What Are We Solving?

Imagine this scenario:  
**Admins or Project Leads** need the ability to create users/roles with elevated permissions. But the catch is that **those newly created roles or users can't create others with full admin access**. This prevents unwanted privilege escalation.

### How We’re Solving It:

1. **IAM Permission Boundaries**:  
   **We use permission boundaries** to restrict the maximum permissions a role or user can have. This helps ensure that no one is able to assign themselves—or others—**unlimited admin privileges**. Boundaries are set to prevent users from performing actions like creating new users with full-blown admin access.

2. **Service Control Policies (SCPs)**:  
   **SCPs act as a guardrail** at the AWS Organization level. They restrict actions like granting admin permissions to roles that would otherwise violate our security policies.

### Why This Matters:

Security is paramount. By **combining permission boundaries and SCPs**, **we ensure** that even powerful users can only do what’s allowed, and **there’s no risk** of runaway permissions granting admin rights to everyone. **This combination allows for strict control** without compromising functionality.

---

### Repository Layout:

Here’s the structure we’re using:

```
├── terraform/                       # Terraform configurations for this security setup
│   ├── main.tf                      # Core setup for IAM roles, SCPs, and permission boundaries
│   ├── variables.tf                 # Defines variables used in the Terraform files
│   ├── outputs.tf                   # Outputs for useful IDs and ARNs
│   ├── policies/                    # Policy JSON files go here
│   │   ├── project_lead_assume_role.json    # Assume role policy for project leads
│   │   ├── iam_permission_boundary.json     # IAM permission boundary for controlling privilege escalation
│   └── versions/                    # Folder containing SCP versions for version-controlled security policies
```

---

### The Workflow

1. **Define IAM Permission Boundaries** in Terraform that restrict users from creating new users/roles with full admin access.
2. **Apply Service Control Policies (SCPs)** to ensure organization-wide security control, so no one can bypass the rules.
3. **Terraform is used to deploy the configurations**, ensuring that all IAM policies and SCPs are applied consistently across the AWS Organization.

---

### How It All Works Together:

- **Admins or Project Leads** create users/roles, but with strict boundaries.
- **SCPs act as a backup**, ensuring organization-wide security rules are enforced.

This method ensures **no runaway permissions** and enforces centralized security control.

---

### Let’s Dive In!

This repository is perfect if you're aiming to **lock down privilege escalation** in AWS while allowing **flexibility for DevOps teams**. We’ve combined the power of **IAM**, **SCPs**, and **Terraform** to provide you with a solution that’s **scalable, auditable, and secure**.

