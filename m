Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616125D1FB
	for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813223; cv=none; b=jdSmGFmU8mvOBuDmOjb+bzogKrP3SpxqlDv8qN/mju2AaC/Tqw4doyebshBmplMOE8XtxyJ9RtxLBfu8cFd02LxP5wvjPKkFYA0mtUFNGhLYn9/At0WbUpP8EUPHCutsYE+Gjll2ey60kgiBh4zablXVFYddIW+oyzVYrxG5j1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813223; c=relaxed/simple;
	bh=4Mqx6j1jEgu3ftEu9pNFMxQ/rycz0f5ou4C4LnYwews=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dVXnrODoSEST6Wifd1id+TAk6zW5s9jkmWYAY4sdXcmEVTzrU3cLs8gZ6CoCIRrSdSoJHBOvXAkvpmUSb05DaBeGJ4FxpR3hbsw88QTvhl/pwUhn9iu4GzmN6l6Rn5GN01qtZUXHA6gsUFdI+j0YPRqrueLOgfPtsL4b657UY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L/bP3aXG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L/bP3aXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742813221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gu+IHy3eWsxqSL7KQBKuMTqUX8nLvgcOBpryY3nmz5I=;
	b=L/bP3aXGDJmfW6mGsHSwdQbZr/KXlCUMMzKGm4MiN4wTzn7Q4iuW7MZ12eSmnpP3zZr1iZ
	F7VPZSMAYtvPAIKuJZLH2wvxPgFsvSESaQK5BjuT453dYoyKhdkbqB+d+GFW2Kd1JhygIn
	nCC0dlEloB24HQab50Slw8jWGVXgQTQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-vlQfTEOZP7-FyJ0GfJRzOQ-1; Mon, 24 Mar 2025 06:46:59 -0400
X-MC-Unique: vlQfTEOZP7-FyJ0GfJRzOQ-1
X-Mimecast-MFC-AGG-ID: vlQfTEOZP7-FyJ0GfJRzOQ_1742813218
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so33386625e9.2
        for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 03:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813218; x=1743418018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu+IHy3eWsxqSL7KQBKuMTqUX8nLvgcOBpryY3nmz5I=;
        b=qJaLLme+qcu0O8W77UCFJp0cB3lF9vUViG3CtVo+bDBsW3RJBgd5Mdx5ZyR32NsvHa
         ql0Widzz0bMWKA0cHQPjl5eagfVyIqIxUkFQu7QETolWETpgZu/04OmXtsD95Dq8O49V
         SmYNv8iHseomwGubE3Hk5SRrSKJBGtVxtvEGZkY6+t622eghC2B75Wz98dFOwamQE3NL
         LaeLakBOvEW+SDqO2qr/6AB6vxcSSrA+fu+5E/2jPG2YDCt+Ku13kgParKlKcM6qLANo
         a1E+Szd4iwXAa3rp69tlvlPnxuF6vXw+yZwT16y6TTtVR+yig2QP4lSyLwfaYimMEjtu
         9l8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWz7tE8oU8QB5H6FjrqNzd7fDovfJFPfly1sJLh0vIuElclnfBCyiYWPQHgCEjXw3/E5rFdjOX+Sp8C@lists.linux.dev
X-Gm-Message-State: AOJu0YzLWEACm14k4Ey7N4Ddwraq+UTAtx5n422A++p/UJrrO1pGMMte
	nTIaWHq4sS2h9CiscPWPIXTiySD426UM9GWzV0r+1fwfkElPSEBpE66prZf7Oo6L430tq2OjMLw
	WnlJEyWzN44dAHf7jtZ0+JMTOR7WFpos2XjdKCrgnQYO6OqPRFCuPMw1tej4=
X-Gm-Gg: ASbGnctjEzYEgKTVcJ6ePJdGccpKdsz3vivBTqNzL6pSkUL/d4KsREbQRUBrqSsRQyf
	3TjGjfizpM6ejAoWTv/oizVN8tR2uzwIsUTAGyqnusAEnTNxlWm6gSP0vffP9SRdJ4BTPShFgIe
	KeRBLp4Q18Yb6p9LrPnOZH/Iu3e6o1WnLryLmITM5828DZkSHy/HaR3TZa1ue9cvZwsbmk46Jlz
	BrrkdAXUi/VTnv4czP1hmVccQDcQpOXHP7rFUIu/EGZ9Jx0O/VO/1SOcQ3w+JzpuOCVvU1GUgfZ
	6iXelT9t8DuKD80qHaXTuvf1vUqX8dKj7TlaeFHI9S7RfwjAwK0cnTPLKrvTO41PeQ==
X-Received: by 2002:a05:600c:3c82:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43d50a1d1ebmr93437515e9.22.1742813218239;
        Mon, 24 Mar 2025 03:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGANQB3rvIgZOSWD0gaPpOgHDkFySb04GZTBXL6jb8c8aJd3br4jmx1zWOwoz7jHrhpRHPjag==
X-Received: by 2002:a05:600c:3c82:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43d50a1d1ebmr93437075e9.22.1742813217491;
        Mon, 24 Mar 2025 03:46:57 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e645bsm10678195f8f.67.2025.03.24.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:46:56 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-coco@lists.linux.dev,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	linux-integrity@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 0/4] Enlightened vTPM support for SVSM on SEV-SNP
Date: Mon, 24 Mar 2025 11:46:45 +0100
Message-ID: <20250324104653.138663-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xBTVk4PfZERUpg44WscxK6RC-jEJLJsXUqW8JXYuqiQ_1742813218
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

v3 -> v4
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

 arch/x86/include/asm/sev.h  |   7 ++
 include/linux/tpm_svsm.h    | 149 ++++++++++++++++++++++++++++++++++
 arch/x86/coco/sev/core.c    |  67 ++++++++++++++++
 drivers/char/tpm/tpm_svsm.c | 155 ++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/Kconfig    |  10 +++
 drivers/char/tpm/Makefile   |   1 +
 6 files changed, 389 insertions(+)
 create mode 100644 include/linux/tpm_svsm.h
 create mode 100644 drivers/char/tpm/tpm_svsm.c

-- 
2.49.0

