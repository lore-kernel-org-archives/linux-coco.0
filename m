Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0F1CDFBD
	for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453781; cv=none; b=Ip6/3AZoKY3x+sGPz5GR9jeZ/FI4hnU7fKTZAtQ57cuQhku/ax05xcUeoaOAkmGqUWFv7bEE7XPs9lHqy4qpkQ9E2N955pXc9ibOWE/2wmZnod0XshMiolvDMrBORMX3wefRcZOBoY1m8Y1+N3mnc5N639rAISqNAaI9iIuYARg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453781; c=relaxed/simple;
	bh=CUjyFOj39YorU1rHLO0sTkR/yrPmMys639+m5J7tLN0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ShlqA4jtln1YnBL8J3gx11FNug/OmJfqDnwby/YCSVxDYYHH2Kn0vPYZVPAIKK7CRPfb3EgFEXTN+J0tEuIXcctFq4fLpLkIbkVP30bnwtOT8e3kiHTgfF1hP1nfJt3FL7w1ZHX4t6n7r+cAHRS0b8XNHC/Oi33C3GN3Vvi9A4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GSEeQ/s5; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSEeQ/s5"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-20ca7d8670cso61035525ad.2
        for <linux-coco@lists.linux.dev>; Tue, 12 Nov 2024 15:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731453779; x=1732058579; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M3XmrVnp9BElk4dkMvhlaiUVjoXVs8lQYv4BslpgjjQ=;
        b=GSEeQ/s5vx7PfxY6gBLiaMvkgrR4BdMj6rzkLtR9ymYi8wbO7wxHqL/bYsmHgWfK+z
         fRvK4BhcRRm9XuCIvX3amHGoJwum7EljfQ1jstHcYNw65M4jq79su8cRM50jVfmldVjo
         RIv6UlWZa3wl/zFB356BWWXNc3pKk1e0IiB2NCGY81PdpYd9Hs98dKLX8u+dRFG0NYBM
         yVabiKreWo3baKGZ2VPaMfWZEMJM1HSwmhFE97Ueqf3juYLKJhsCTLrBqDpM/9NW65oQ
         maDGYQzcXWtonIaU4D77HK1Omq0jrhtY+td7g9d2HCowhWtMZ/RmQKXku4aDabXEQwQZ
         lt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453779; x=1732058579;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3XmrVnp9BElk4dkMvhlaiUVjoXVs8lQYv4BslpgjjQ=;
        b=n6UuDIixkoGtbUY/R6F9v1DvPpYEw8U+Kq4DMxbyWsdSXiVOBNjZFrQJZ8/yO55HE5
         +0qXbW1gOA8LCBLY45ADxHgpPZSXXclmF65m/jsKtLqIwdqebZLzKrDsyX7f4swxUI2F
         WdnYXHCAlIy+Lsg2VHhKNkB6FQ2OPWP4HryndnIDnX0frSTcCSypKVnhysR6TmVyCRGj
         F691FWaMC4WKoK0xdKEx0cy4ROO9BYKZTkAHan7Z43yeiDE24Mtml2wsSxbhNeM3Vr0t
         eYJe4kZlMITfs9LGn9ty0WFv1xKj8KClzX23JQp4xXhVLT4m/UUAAsMGqtqRgLyLfj8G
         SljQ==
X-Gm-Message-State: AOJu0YyF7NZ0SuShT/e5ayzF8uFkIFWMRPyCqBrduHj1SD0HNx0zfSdc
	G4Q/f5d3fSLlu6czQwsjcF/jj/grwTQz/iZJaGxZf2YQW9uZfUUDOTh4C+TAo7O90PN7rYqT+3W
	A4omGFHZQxVMZkpnT8qH1qg==
X-Google-Smtp-Source: AGHT+IF2kbOD4BHMEB3iS4+dImR1c6aIsq4fWNz5V3AwFhnCHHU8DBkF+Bb8Sq+TGS3yZfnleGeVHPFj3xex974ZfQ==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a17:903:683:b0:20c:da66:3884 with SMTP
 id d9443c01a7336-211835a0b65mr368175ad.9.1731453778925; Tue, 12 Nov 2024
 15:22:58 -0800 (PST)
Date: Tue, 12 Nov 2024 23:22:39 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241112232253.3379178-1-dionnaglaze@google.com>
Subject: [PATCH v6 0/8] Add SEV firmware hotloading
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>
Content-Type: text/plain; charset="UTF-8"

The SEV-SNP API specifies a command for hotloading the SEV firmware.
when no SEV or SEV-ES guests are running. The firmware hotloading
support is dependent on the firmware_upload API for better ease-of-use,
and to not necessarily require SEV firmware hotloading support when
building the ccp driver.

For safety, there are steps the kernel should take before allowing a
firmware to be committed:

1. Writeback invalidate all.
2. Data fabric flush.
3. All GCTX pages must be updated successfully with SNP_GUEST_STATUS

The snp_context_create function had the possibility to leak GCTX pages,
so the first patch fixes that bug in KVM. The second patch fixes the
error reporting for snp_context_create.

The ccp driver must continue to be unloadable, so the third patch in
this series fixes a cyclic refcount bug in firmware_loader.

The support for hotloading in ccp introduces new error values that can
be returned to user space, but there was an existing bug with firmware
error code number assignments, so the fourth patch fixes the uapi
definitions while adding the new needed error codes.

The fifth patch adds a new GCTX API for managing SNP context pages and
how they relate to the ASID allocated to the VM. This is needed because
once firmware is hotloaded, all GCTX pages must be updated before the
firmware is committed in order to avoid VM corruption. The ASID
association is to bound the number of pages that ccp must have capacity
to track.

The sixth patch adds SEV_CMD_DOWNLOAD_FIRMWARE_EX support with its
required cache invalidation steps. The command is made accessible not
through the ioctl interface, but with the firmware_upload API to prefer
the more generic API. The upload does _not_ commit the firmware since
there is necessary follow-up logic that should run before commit, and
a separate use of SNP_COMMIT also updates REPORTED_TCB, which might not
be what the operator wants. User space has to coordinate certificate
availability before updating REPORTED_TCB to provide correct behavior
for the extended guest request GHCB API.
When the firmware successfully updates, the GCTX pages are all
refreshed by iterating over the tracked pages from the GTX API.
If any single page's update fails, the drive treats itself as if the
firmware were in a bad state and needs an immediate restore. All
commands that are not DOWNLOAD_FIRMWARE_EX will fail with
RESTORE_REQUIRED, similar to SEV FW on older PSP bootloaders.

The seventh and eight patches are a small cleanup of how to manage
access to the SEV device that follows a similar pattern to kvm. This is
needed to not conflate access permissions with the GCTX API.

The ninth patch switches KVM over to use the new GCTX API.

The last patch avoids platform initialization for KVM VM guests when
vm_type is not legacy SEV/SEV-ES.

The KVM_EXIT for requesting certificates on extended guest request is
not part of this patch series. Any such support must be designed with
races between SNP_COMMIT and servicing extended guest requests such that
the REPORTED_TCB in an attestation_report always correctly corresponds
to the certificates returned by the extended guest request handler.

Changes from v5:
  - Fixed attribution for Alexey's error patch.
  - Removed the new access-checking method in favor of taking the device
    fd in the new API. A follow-up series should clean up the already
    existing over-checking of the fd.
  - Removed unnecessary name change in kvm.
  - Added comment about probe field use in KVM.
  - Added more error checking for asid argument values.
  - Made GCTX->guest context, asid->ASID changes in comments.
Changes from v4:
  - Added a snp_context_create error message fix to KVM.
  - Added a PSP error code fix from Alexey Kardashevskiy.
  - Changed tracking logic from command inspection to an explicit
    guest context API.
  - Switched KVM's SNP context management to the new API.
  - Separated sev_issue_cmd_external_user's permission logic into a
    different function that should be used to instead dominate calls
    that derive from external user actions.
  - Switched KVM to the new function to complete the deprecation of
    sev_issue_cmd_external_user.
  - Squashed download_firmware_ex and firmare_upload API instantiation
    since the former wasn't self-contained.
Changes from v3:
  - Removed added init_args field since it was duplicative of probe.
  - Split ccp change into three changes.
  - Included Alexey Kardashevskiy's memset(data_ex, 0, sizeof(*data_ex))
    fix.
Changes from v2:
  - Fix download_firmware_ex struct definition to be the proper size,
    and clear to 0 before using. Thanks to Alexey Kardashevskiy.
Changes from v1:
  - Fix double-free with incorrect goto label on error.
  - checkpatch cleanup.
  - firmware_loader comment cleanup and one-use local variable inlining.

Alexey Kardashevskiy (1):
  crypto: ccp: Fix uapi definitions of PSP errors

Dionna Glaze (7):
  KVM: SVM: Fix gctx page leak on invalid inputs
  KVM: SVM: Fix snp_context_create error reporting
  firmware_loader: Move module refcounts to allow unloading
  crypto: ccp: Add GCTX API to track ASID assignment
  crypto: ccp: Add DOWNLOAD_FIRMWARE_EX support
  KVM: SVM: Use new ccp GCTX API
  KVM: SVM: Delay legacy platform initialization on SNP

 arch/x86/kvm/svm/sev.c                      |  72 ++---
 drivers/base/firmware_loader/sysfs_upload.c |  16 +-
 drivers/crypto/ccp/Kconfig                  |  10 +
 drivers/crypto/ccp/Makefile                 |   1 +
 drivers/crypto/ccp/sev-dev.c                | 186 ++++++++++++-
 drivers/crypto/ccp/sev-dev.h                |  35 +++
 drivers/crypto/ccp/sev-fw.c                 | 281 ++++++++++++++++++++
 include/linux/psp-sev.h                     |  72 +++++
 include/uapi/linux/psp-sev.h                |  21 +-
 9 files changed, 614 insertions(+), 80 deletions(-)
 create mode 100644 drivers/crypto/ccp/sev-fw.c

-- 
2.47.0.277.g8800431eea-goog

