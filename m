Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEB1E32D6
	for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686160; cv=none; b=tAkK/oWkg9iFNTS4EQoXMJ00Lt3/E1oivaD3t+X7hJjHapcQt3QEOVj8Bz3opOck1D4UYAX3+H3d1cRDGe3W/6yN5O9bLGNdRwNUV/19NHeSFqnhkFGDppPSq1ZApebwBCEh2fQ9vbxAGTfLaeOqE/n7pXl+maWAM/rFRVCWsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686160; c=relaxed/simple;
	bh=bk1utCoL0jpm+fE7QxhWVPAm20ULaoWKvqvMoOSo3r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UGKB9kXSsoMZMsZc92sJTqTU9bgJstgND93G/ph55R7LtcuEbBoWTfJfZCUpNKrufSvzmVvbvZ0+gIN3DvA5GtSLsq64StDq0nT122ndSl8dMABvcIjjkLilbMs5sbBI2As2ohTE26x+QV/eT8EfGuC5eqWqf+VMc//rjQ5l/p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUehpwFn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUehpwFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741686157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VtUeSeWcd1CI3feUKO1y+/FGn6aMUK50DGWtG1Q+97U=;
	b=NUehpwFnwQzVY2RnobJ5Ilpdyq2YTZiPS7N+aBWvxZiWenzSEo4lnX1KuzDk8jnfMhOxDQ
	Ly/3Q1/4nVX4LTN4Ao9LKEu2u3p498yxBOn1Wxfl2QWRZUJhfaHhbON0WvQjJweFYiZruz
	+YEKXdHLuepEKxYaHVGZkBr/QEaj9/k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-nry1dfMROwe8waTlJ-j0Ag-1; Tue, 11 Mar 2025 05:42:35 -0400
X-MC-Unique: nry1dfMROwe8waTlJ-j0Ag-1
X-Mimecast-MFC-AGG-ID: nry1dfMROwe8waTlJ-j0Ag_1741686154
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abb9b2831b7so763351366b.1
        for <linux-coco@lists.linux.dev>; Tue, 11 Mar 2025 02:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686154; x=1742290954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtUeSeWcd1CI3feUKO1y+/FGn6aMUK50DGWtG1Q+97U=;
        b=a5bkkf6rjLDNIUV+I5fhRDFJfWiMOJgm5r5K9RriLjBpKgRCsJd5zDNBKKB4rhnRwd
         uCSvo7kSPK2jNYLIQZfjuidSW/dvwquiSjSU4ulSQ4UcAlE9bAhSUY8iI20/kC0Lj7HH
         edoPja0iyRUkCSsukO2lHAq7woBTI1UGSxTeiTLwedE2/3/ANNFbljHJjAG4ne/r4DBm
         XYOGn/Jkr+2hVGdZMNyCUQL+MAzoeDgu6egV+yp6MV76KCbtzSFyzCJlbaNwoOqql9C6
         1/+Z+dsGDetTvYR1pqc2f3kSXNI6NbGfONYLW/apP1K1pCnFPw0d/xGdF8SQfklnkk0b
         GK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6QtTzeCaj/JznStF4bIggyKJnHqIcgxa3uTKxYzbseJ57G/nDlHcnSs8Q5sgB93DvTnHgtgupoRo3@lists.linux.dev
X-Gm-Message-State: AOJu0YxjwNhNmE7vd96KR704odLn35Ga0jun4FjT9p2iRn+leVvxX968
	f/ddqOQmzsJzZk9SCIySkb1N4ve3Dc621H+yezcocU6mYYHDEENWCSNdkSY97fHAZYysVFf8R0i
	3OL6FEi6D1f17qT33weZh6vWjAOHz/ggsPr+TIp2LvMtbEW3dOcsUMwWIHZk=
X-Gm-Gg: ASbGncts0uWJGDlwyY0n1WXp5Jz+qFTCjBAKtH8X47lFVjivHuy5YgZEGg+cwae3Ywj
	1kmYSnnkylEhmWLZsSscUepgzod8jgN9TZ1r1PEWKr0UTwuSUF+SQAWI/kB07lRAfYz1xUoEqYG
	z3YV+Qv9lfUfyhvpRDOLvIV52zth9k1avL3CBv4qfXtWvDdifILlRrJAaWJ+XPOe5XaMpuzwY0q
	O5jKs3uDAgsi3b8i6ZmIN20uYcKc3R/sk4ZW0vKCAJr2wbWUzy9ZaO41e9JudxcbjaV/FLtrl11
	mVL9NuDanVyfmyvPcSIojr872eukrmzcMIaBKd/WAssnnHaiKs1VakWvADQ+Da3BWTl5YgzG
X-Received: by 2002:a05:6402:40d5:b0:5e7:87ea:b18c with SMTP id 4fb4d7f45d1cf-5e787eacf57mr872943a12.15.1741686153793;
        Tue, 11 Mar 2025 02:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY2OSneC4cl7aSD4PE0BPNJTrwCmoiCQ+JTyO3tvYbex45WTvoHfGFh8SwSjQWrtNpqraj+A==
X-Received: by 2002:a05:6402:40d5:b0:5e7:87ea:b18c with SMTP id 4fb4d7f45d1cf-5e787eacf57mr872899a12.15.1741686153165;
        Tue, 11 Mar 2025 02:42:33 -0700 (PDT)
Received: from localhost.localdomain (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7473c17sm8118639a12.28.2025.03.11.02.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:42:32 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	linux-coco@lists.linux.dev,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Joerg Roedel <jroedel@suse.de>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 0/4] Enlightened vTPM support for SVSM on SEV-SNP
Date: Tue, 11 Mar 2025 10:42:21 +0100
Message-ID: <20250311094225.35129-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iNousuwNTK_TIpESYXLsVJ4_hsBGdm7ET6T6usLX03g_1741686154
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

v2 RFC -> v3
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
 include/linux/svsm_vtpm.h   | 141 ++++++++++++++++++++++++++++++++++
 arch/x86/coco/sev/core.c    |  39 ++++++++++
 drivers/char/tpm/tpm_svsm.c | 148 ++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/Kconfig    |  10 +++
 drivers/char/tpm/Makefile   |   1 +
 6 files changed, 346 insertions(+)
 create mode 100644 include/linux/svsm_vtpm.h
 create mode 100644 drivers/char/tpm/tpm_svsm.c

-- 
2.48.1

