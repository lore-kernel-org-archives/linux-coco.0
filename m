Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048DF218923
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022124; cv=none; b=Cjt+4IJGePuzDkb3f5szrF2M3O8/nwwBWd2BekkwejTMzJUjhXkZiUWUrnSfmu9Vz/iywRY6z1/Q96vpg3kxJscdOA9RdT4qHKr9hYdMhoX7BLiBjKSTCFlAzAd0R4BjUKitKKfEbE6bAUESlZlodtS/rOtYA5t7Sf10p41GcOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022124; c=relaxed/simple;
	bh=JTypIxdd/KhXk+4SOUYtFRsM3+90bmnhEEwggEeXzAs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Kui2No5rAwTr+5gQzLUYQNejmhlY/y7xBwiJVh3JgArcx8FFEULihaUeMXSzWGVwncfxJ6SAA2yIycJLKA5ry2XoyJ6ZsXUcL5Y6h/ZkfqXDKwp4MDa3kPUeT4WizYq2+gh5JETm9JS8Jh2L5AHp9mMQGgs9Yq3k9M+zIQ8bVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uLZx0TxQ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uLZx0TxQ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7eb07db7812so1196083a12.0
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022122; x=1731626922; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uRPtpMpqwdTWBThkh9qIUAPYk6Y7g0a7eO2K/3byBeM=;
        b=uLZx0TxQkiR8G6L22nSh7H5rDfHxurb5uGFwRyBsmcQs1EwVrdxwS7gx7h7xyvuwU3
         3+3VFPdBrEIiRAtApT2jNnapXlhKKGklBsMoRY0m3a08lb/J6u0qvzx2smZh7dvB8ff7
         M1Sq+Wvs2bMSn+I6TRGLUtxIXk7XiqqydE7ocfYLYhX8nAOwCbOuZXNCP1ydij5xYbYw
         HJUki+l7wEjpTEVln4k4G3JNPinEbgPgm52lV/xNOTy9Sxq8kuMNUR60ixj6b2S+aA3X
         XcxdtP5CXsCI0W2f9yGwAGO69/JCy9qhqyfSH7eq0IT1RejmuZbo8ZrqHZHiAk/ZIJLl
         FJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022122; x=1731626922;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uRPtpMpqwdTWBThkh9qIUAPYk6Y7g0a7eO2K/3byBeM=;
        b=G937X8uyAVpqwAszzDY+G5x04ORzD0mfkR4sONF7/tF/heiK4mIU0zX7Hm/Hgyg/Si
         ooPQqOGyTIdeJW4aaztgN6s3icRWomirdBRXHoN8KUGUfjSMMC39Tbq5QqBwyi7zLcqK
         1dmjnDuxhDYtAGuv8vhqlG5iVOkgAqNaa1NVXmzQlBe410Ez/8bSRCXIxzO5sd75Nb/R
         VCx02Jo+ZyIp2SUcaoTOyzQ2F/u6qcXrBu8DQbFN/NpByGN+RONxTaRwTgpMzQVPvEoZ
         HUpSJko+seOC/OBG7sJMEY+M4cGAXSyFJnObc38YQC3SEXkgVGiOyKm1Ne7i69hWPUyn
         4Wyw==
X-Gm-Message-State: AOJu0YyVs92sF93v+uA1d08U5EHHPvqkZ70QMipihCPyA6mU9QAsCD3n
	AgNhZNIOntWTFfhZUWr/FYsFaLiR+kGim5XVum6oCkxCSRqccPDoRSY04BLi76J1JEUAMgPBY0i
	+Hb/QN0cVCJ4o+k0TOPYzVA==
X-Google-Smtp-Source: AGHT+IGRE2gP8+3E6XJ0QHjHFUArDAqHuRZ5klmTrNIkOidkP40y++ZFW7K7Uuu0rTf7PzkCiBy5FzMYYRNqR8Duvg==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a17:90b:2d43:b0:2da:872e:9ea4 with
 SMTP id 98e67ed59e1d1-2e9b1f7f075mr7920a91.3.1731022122306; Thu, 07 Nov 2024
 15:28:42 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:40 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-1-dionnaglaze@google.com>
Subject: [PATCH v5 00/10] Add SEV firmware hotloading
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Michael Roth <michael.roth@amd.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tianfei zhang <tianfei.zhang@intel.com>, Alexey Kardashevskiy <aik@amd.com>
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

CC: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Ashish Kalra <ashish.kalra@amd.com>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: John Allen <john.allen@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S. Miller" <davem@davemloft.net>
CC: Michael Roth <michael.roth@amd.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Russ Weight <russ.weight@linux.dev>
CC: Danilo Krummrich <dakr@redhat.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Alexey Kardashevskiy <aik@amd.com>

Dionna Glaze (10):
  KVM: SVM: Fix gctx page leak on invalid inputs
  KVM: SVM: Fix snp_context_create error reporting
  firmware_loader: Move module refcounts to allow unloading
  crypto: ccp: Fix uapi definitions of PSP errors
  crypto: ccp: Add GCTX API to track ASID assignment
  crypto: ccp: Add DOWNLOAD_FIRMWARE_EX support
  crypto: ccp: Add preferred access checking method
  KVM: SVM: move sev_issue_cmd_external_user to new API
  KVM: SVM: Use new ccp GCTX API
  KVM: SVM: Delay legacy platform initialization on SNP

 arch/x86/kvm/svm/sev.c                      | 104 ++++----
 drivers/base/firmware_loader/sysfs_upload.c |  16 +-
 drivers/crypto/ccp/Kconfig                  |  10 +
 drivers/crypto/ccp/Makefile                 |   1 +
 drivers/crypto/ccp/sev-dev.c                | 140 ++++++++--
 drivers/crypto/ccp/sev-dev.h                |  35 +++
 drivers/crypto/ccp/sev-fw.c                 | 267 ++++++++++++++++++++
 include/linux/psp-sev.h                     |  93 +++++--
 include/uapi/linux/psp-sev.h                |  21 +-
 9 files changed, 572 insertions(+), 115 deletions(-)
 create mode 100644 drivers/crypto/ccp/sev-fw.c

-- 
2.47.0.277.g8800431eea-goog

