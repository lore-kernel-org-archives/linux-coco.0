Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45951DA63D
	for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417551; cv=none; b=eWQ907v514EpVwg3P1pI4x238qeuZttvw909bfq5oFK54IqdvS4Kq1pStfaMUhWjEI2v8JNs3QbOTkBfxp0qKDd+3p5ho6lDUGm/DByHryEfVgncLnnBMWpTNHOq28c6au1PUlPpCTH0i+V70MQ+53BgN/BKqnQIja0wUqwdmJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417551; c=relaxed/simple;
	bh=7FQ3ZAJ+CLeoOCelvs7geNmEmhE4pottDirHjHN/mPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CYbyfq2IgXskIL59IbtgxkDjbV4+K75ES6bOJ/U7AiRjDxfSicEKnbS7MrJngHzGsG3cM7KCPPYGsbT7yy+YBZG+D2AYUWM6rOOPL4v5UmeJ0gdpRh930/FL8r2YoWO6giEZZj7/ydOP5HfLLNwLdiXjz8NzjagKBxnNGIFcRn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UT5h2BVx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UT5h2BVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743417548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qBTY5l5HGc+xOBdXRSCCf8S8zxGLxopVuhSBBbk66v8=;
	b=UT5h2BVx8ExpmlUtGgJtjqSuB7SIHkaOkoNakFwuodsnTf5EwXx/RT8agyC/Nufj9IqdCm
	piFV1p1s96n3jZ1Z2QYASn2EGiN2alfFkWLrxe6ogweZgIo697J+F9ACHMtWNM+BvCt28E
	FEevFwEd1F2yTkFgqWsT2/uWUYzJCpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-d-4BgfMyMKuVHcXCdysrgA-1; Mon, 31 Mar 2025 06:39:05 -0400
X-MC-Unique: d-4BgfMyMKuVHcXCdysrgA-1
X-Mimecast-MFC-AGG-ID: d-4BgfMyMKuVHcXCdysrgA_1743417544
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso26071395e9.0
        for <linux-coco@lists.linux.dev>; Mon, 31 Mar 2025 03:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417544; x=1744022344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBTY5l5HGc+xOBdXRSCCf8S8zxGLxopVuhSBBbk66v8=;
        b=pmKnLCX6fyfDKbzeK9HWSOtd5Ois0wsJk/KaMQIbA5FHqmUUpcZ9ZJWgFfL4/csA/3
         PYI967p7Tzlf/O9fhCPJscxi9IVj3WY02bgAq3gMcApgxdMrp/DyrtH+HzsUCx2Ur4+2
         p6lajdVAz5RZfquN9tf75St/tnGiBKE/Vbt87IFeAka7tNUjSAFd7+y9i5DY8kT6UKKi
         EsdA8sJc1lQvYahmhD/ycaz8lb/2jsdUSaiBTj23Ba3XFyn6p3v3bFXRSBeOvuwnxYPF
         1OmEqhblo05HKmt1Isnj8dyc8txBrPmnyzXpmQ57IBtmqzAUYs9KKOFV/7l2NqlqCzXZ
         6pqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX17elMHxbW9tXJ+p8hcA7sPv9hJEPELpUV1INtG7YDpMNPZ6o/FUhChaU14pYaFEgOqsYMPCnclx2+@lists.linux.dev
X-Gm-Message-State: AOJu0YyiURbHWpZJ1DFob9InX41pZB6r0wSKuOSlNpW1gtrjRf9ZQnKN
	ctm7kkd4x/AQEHRor+Lptt5e6wTsezpRx0IXayaQQUB5961daCGIuD58o6A43dW5NAIeKzMkCed
	cfNAARhyy43hq+CXh6oS8XKko9uq/6a981X6cfUcCVJNZkHy735lUHbkKPUM=
X-Gm-Gg: ASbGnctTXWfPukCHhJNO6z3sJ/6Q9pppyKJMwrvH4Xl3hWqCe5GEPkGLgaRJGDu1Lrw
	T3Jx3S7y9BtlWFRdiAo8LXic50qDjjwZ7aTHash+lgQsgao1JSJyunlYh4t7hWnR1NX4LVhhaNE
	nagZHV4gk8Y5jOtsOCgMkoF8gBDG7/bS2rk2S+JybM6q/x4kxnHK+dRnHdycOEHoY4cUYVyAdxI
	BEGU4Rrs3/KNXZ3w82+yhvKnFjKdL+QL2x8Y0aHaUB2CMLIxdYZ+jSg6709B63AgnVclYJAlyIZ
	D9SF5Xqaq1YRUGzOG0xosyGPed2isiP1T3/YP2oR8R3x5kt6td7oeVuSBhlA3LOg5A==
X-Received: by 2002:a05:600c:cc8:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43dabe16c87mr84304745e9.0.1743417544226;
        Mon, 31 Mar 2025 03:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhLAmpHABmT9CznTBONppljPwrwhqpPqgWIgM6RyPVW5LtIkj4R4wW0S/gnaKHEdEP7dj9XA==
X-Received: by 2002:a05:600c:cc8:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43dabe16c87mr84304205e9.0.1743417543732;
        Mon, 31 Mar 2025 03:39:03 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d916e1842sm61650615e9.2.2025.03.31.03.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:39:02 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	linux-coco@lists.linux.dev,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <jroedel@suse.de>,
	x86@kernel.org,
	Dionna Glaze <dionnaglaze@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 0/4] Enlightened vTPM support for SVSM on SEV-SNP
Date: Mon, 31 Mar 2025 12:38:53 +0200
Message-ID: <20250331103900.92701-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kr8A0IuMCIqUEdf64ZY3h1Ll38l3rx8M0E_sZySC9jA_1743417544
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

AMD SEV-SNP defined a new mechanism for adding privileged levels (VMPLs)
in the context of a Confidential VM. These levels can be used to run the
guest OS at a lower privilege level than a Secure VM Service Module (SVSM).
In this way SVSM can be used to emulate those devices (such as TPM) that
cannot be delegated to an untrusted host.

The guest OS can talk to SVSM using a specific calling convention and
instructions (a kind of system call/hyper call) and request services such
as TPM emulation.

The main goal of this series is to add a driver for the vTPM defined by
the AMD SVSM spec [3]. The specification defines a protocol that a
SEV-SNP guest OS (running on VMPL >= 1) can use to discover and talk to
a vTPM emulated by the SVSM in the guest context, but at a more
privileged level (VMPL0).

This series is based on the RFC sent by James last year [1].
In the meantime, the patches have been maintained and tested in the
Coconut Linux fork [2] along with the work to support the vTPM
emulation in Coconut SVSM.

The first patch adds public APIs to use AMD SVSM vTPM. They use
SVSM_VTPM_QUERY call to probe for the vTPM device and SVSM_VTPM_CMD call
to execute vTPM operations as defined in the AMD SVSM spec [3].
The second patch adds an interface with helpers for the SVSM_VTPM_CMD calls
used by the vTPM protocol defined by the AMD SVSM spec and then used by the
third patch to implement the SVSM vTPM driver. The fourth patch simply
registers the platform device.

Since all SEV-SNP dependencies are now upstream, this series can be
applied directly to the Linus' tree.

These patches were tested in an AMD SEV-SNP guest running:
- a recent version of Coconut SVSM [4] containing an ephemeral vTPM
- a PoC [5] containing a stateful vTPM used for sealing/unsealing a LUKS key

Changelog:

v4 -> v5
- Added stubs when !CONFIG_AMD_MEM_ENCRYPT [Dionna]
- Added Jarkko's R-b on patches 1 and 2
- Removed cancel/status/req_* ops after rebase on master that cotains
  commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} opt")

v3 -> v4: https://lore.kernel.org/linux-integrity/20250324104653.138663-1-sgarzare@redhat.com/
- Added more documentation around public API [Jarkko]
- Simplified TPM_SEND_COMMAND check [Tom/Jarkko]
- Renamed header in tpm_svsm.h so it will fall under TPM DEVICE DRIVER
  section [Borislav, Jarkko]
- Fixed several comments to improve svsm_vtpm_ helpers and structures [Jarkko]
- Moved "asm" includes after the "linux" includes [Tom]
- Allocated buffer used in the driver separately [Tom/Jarkko/Jason]
- Explained better why we register tpm-svsm device anyway in the commit message

v2 RFC -> v3: https://lore.kernel.org/linux-integrity/20250311094225.35129-1-sgarzare@redhat.com/
- Removed send_recv() ops and followed the ftpm driver implementing .status,
  .req_complete_mask, .req_complete_val, etc. [Jarkko]
  As we agreed, I will send another series with that patch to continue the
  discussion along with the changes in this driver and ftpm driver.
- Renamed fill/parse functions [Tom]
- Renamed helpers header and prefix to make clear it's related to the
  SVSM vTPM protocol and not to the TCG TPM Simulator
- Slimmed down snp_svsm_vtpm_probe() [Borislav]
- Removed link to the spec because those URLs are unstable [Borislav]
- Removed features check and any print related [Tom]
- Squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
  with the next one [Borislav]

v1 -> v2 RFC: https://lore.kernel.org/linux-integrity/20250228170720.144739-1-sgarzare@redhat.com/
- Added send_recv() tpm_class_ops callback
- Removed the intermediate tpm_platform.ko driver
- Renamed tpm_platform.h to tpm_tcgsim.h and included some API to fill
  TPM_SEND_COMMAND requests and parse responses from a device emulated using
  the TCG Simulatore reference implementation
- Added public API in x86/sev usable to discover and talk with the SVSM vTPM
- Added the tpm-svsm platform driver in driver/char/tpm/
- Fixed some SVSM TPM related issues (resp_size as u32, don't fail on
  features !=0, s/VTPM/vTPM)

v0 RFC -> v1: https://lore.kernel.org/linux-integrity/20241210143423.101774-1-sgarzare@redhat.com/
- Used SVSM_VTPM_QUERY to probe the TPM as Tom Lendacky suggested
- Changed references/links to TCG TPM repo since in the last year MS
  donated the reference TPM implementation to the TCG.
- Addressed Dov Murik's comments:
  https://lore.kernel.org/all/f7d0bd07-ba1b-894e-5e39-15fb1817bc8b@linux.ibm.com/
- Added a new patch with SVSM call macros for the vTPM protocol, following
  what we already have for SVSM_CORE and SVSM_ATTEST
- Rebased on v6.13-rc2

Thanks,
Stefano

[1] https://lore.kernel.org/all/acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com/
[2] https://github.com/coconut-svsm/linux/tree/svsm
[3] "Secure VM Service Module for SEV-SNP Guests"
    Publication # 58019 Revision: 1.00
    https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
[4] https://github.com/coconut-svsm/svsm/commit/6522c67e1e414f192a6f014b122ca8a1066e3bf5
[5] https://github.com/stefano-garzarella/snp-svsm-vtpm

Stefano Garzarella (4):
  x86/sev: add SVSM vTPM probe/send_command functions
  svsm: add header with SVSM_VTPM_CMD helpers
  tpm: add SNP SVSM vTPM driver
  x86/sev: register tpm-svsm platform device

 arch/x86/include/asm/sev.h  |   9 +++
 include/linux/tpm_svsm.h    | 149 ++++++++++++++++++++++++++++++++++++
 arch/x86/coco/sev/core.c    |  67 ++++++++++++++++
 drivers/char/tpm/tpm_svsm.c | 135 ++++++++++++++++++++++++++++++++
 drivers/char/tpm/Kconfig    |  10 +++
 drivers/char/tpm/Makefile   |   1 +
 6 files changed, 371 insertions(+)
 create mode 100644 include/linux/tpm_svsm.h
 create mode 100644 drivers/char/tpm/tpm_svsm.c

-- 
2.49.0

