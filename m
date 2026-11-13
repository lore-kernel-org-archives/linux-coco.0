Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586125;
	b=N3LPxuTf0HI6Q42UQRc/KYJi4rrUSvoMgf6+9QDFhjoe3JO6Kyn/+KN/DIqu7avFF/hy
	 YtZovotUhzuPUb3UXmPwhVavBijpInyalYKFh9Pab8YIrMLNTrHE6CWyH+NilKUPE7LHA
	 RpQlcyEkHHQWRE5Hktdnb4sLLWfmRvt97FyGWmymeB0o2Mly/OC6+RPvhe5Du+qGCkOS2
	 zfdXMrD+vwcJsc6tUGDA5z1AddZhrlfHbzFjl7CEHqvdTOLgCxVS4CDvnm3w8LnFqcmqB
	 BFtvNB3WgRERZYZgI0HS4YHILjPC3IgiFTG7R+klP95e+DNAkZTM219oun4AhJ1BP6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c8TFvUX1hEZOaHnYgxRbDWuNTMm4qLIKVwFQcFF2K+4=;
	b=JuQa1ftVM4IHVbjSEADsUjbHrr2vgvIc8mzCl1toI/nmk82EQFmTukC63qrwcurqhzjp
	 W0Ct8MDrDdEiyRUlr60UiWn4TAaOsA995HY/i4yhFh/1Q7xkwZcaPV0UC3B9FaPqGzN4X
	 bHDLua6VGk8GQoH/jVPMvBPEqWdq49t1da10/tchK6teFSuVdCachzMZLg+T/jM/XPnop
	 utJiqmXMBBFsruyNk/asITctG1nJXefr4V8g+fSKA0gtsqu8oULcmYIuWC/9kXUrlWGhL
	 tJ+mVlAhYKUwZVtpdOsCTyHTK9/yC5l7cRtxAKqzHlPWarBU/IVRCQH0Xrruyh/fyBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NpnwdSe1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A337606EBA2
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 16:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A337606EBA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NpnwdSe1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so4354735e9.1
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794586123; x=1795190923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8TFvUX1hEZOaHnYgxRbDWuNTMm4qLIKVwFQcFF2K+4=;
        b=NpnwdSe1G3PiUmbXWC18zXkwM//bcGKhybwi0vH7w/vgOpQRV2EH4i4LlFnO6NACZc
         GYsfuIrJM8EC+30u/ltU7bXGNawTtI5t1HldC7ZqcGUv0H73t3ZZZaTt3RtSR+xW7Wsw
         wJ2kSe+3B8phneJVlS/nEzCQZrq6mFf4EJS5XwBM+Ststpivre9YD8lKK4mrGLlPbWXt
         46x/mrmg9DtFiOqbZIZw3Sy9ti3C1Ova88d1lnLF7/d9388je+lO5F6t/u/USzx+rfVI
         EubZXCgR6W1m1jXjgS1m1qCJDdFIo63ZRZdo69N8DeKeOrqiBrdme6FgPs6tIY/wew6a
         hG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586123; x=1795190923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8TFvUX1hEZOaHnYgxRbDWuNTMm4qLIKVwFQcFF2K+4=;
        b=0KrsEOCz9sIDriJx39slO2igdtC3BYYG01Opki6aDibHhsanh8QBaxI8VsKaq70VHo
         hPefz4L0M/EHPJ0/Ng76PLI/vF+HRsgd8fHFh7OgvZhegKUbUBEG3B/17EdkVNrFrOiz
         giOlZSqrVfzGFJQQ4k4PzF9pkHTTqppTft+Dr5vUTNnkVPDpQ+oIs8lcg4O2+WgFllt7
         Cte8MG5RZTmvHUxR6hAEFIiX1gsqJQZzmacpDVTP1+Xxz0nFt5V7rZl589szOaYrOThE
         EydU6+NatQQ7IXiNvhvOmn0J0Hvf+w5mEVVnW6El1Dcmg23IG/TSz9vFZTrBMw/o2+JQ
         VFNw==
X-Gm-Message-State: APuU4Z9Byb/O/IYe/fkVqu+lU09ha7vKDw+ebKc/AhGgkNZNxnJmlbZX
	uCGcLTSrxUEmttdWCyog+f87gR/USzMndPHv4dG64fmVM/9oqi0CdfYcxq7cCZlz2Al+RashdAl
	tKsjv
X-Gm-Gg: AYBFou0QmwCEoTPOh0yoKU6nVBKspnY2r1Ai2JI5enVaqBEAzVK/fBfI8X4Kh21MIXN
	C3Jyx7aU0q68S3fY/5iNvHzl4kMgQ0+ZB3AKKLMayhSOyzMZmCiXP6eGntlxkt5bwrk8wmwGlJu
	R1HLFi2BqqGluPBUM2HsBivhiXB4Hx/NgnVaZ0qFxnUvoLs6n59ENfB9iIKQdkFJXseTZNkoN3s
	Uc8PReJWBM6jiREoltNMG/jruxPCZgW781HvknlAqcSO+icuJFMT80veqEqySeWb6JnHFM7G02Q
	jB9cHdNZ29mUBNBEs74IRBZDTiYEWIePNzpt1MEg+YKLK1SEK7GmaYfVRSNp/jf1KCXm63noRaC
	/hH2OmAQeD7LOr2YJuzCqScOSZU9k2W12D0yP9qUKlul+spGId8MplVdAp/ULgkPOihxiZoUuQX
	MoZzaajMRZUiIMNUIBhB/i6MBGhaEe076UkwJQYx91LNeakk/74sVZkVsEAttWf3KcClR0cLjCn
	M2i4JUPzFoAxrLzuCDtT0GOU8L6rB2ScnfUKy6ptywo3ytoNFqHOcmjV7lIZ0S7buIg0g9szGvM
	I+BqytkWbGYNvwDv6TEuwEaWR2HhwIXH6CSMCKmY
X-Received: by 2002:a05:600c:3509:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb55c5f579mr61042745e9.2.1794586122529;
        Fri, 13 Nov 2026 08:08:42 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm68947475e9.13.2026.11.13.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:08:41 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 0/9] attestation: Add a common subsystem and TDX support
Date: Fri, 13 Nov 2026 17:08:29 +0100
Message-ID: <20261113160838.2512652-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Linux has several attestation interfaces, each tied to one technology.
Extending a measurement takes device-specific flows for TPM, CCA, TDX
and SEV, none of them discoverable, and requesting a signed quote takes
another set, SPDM included. A new root of trust has no logical home
short of squeezing it into tsm_report and tsm_mr: tsm_report covers
reports alone, the MRs went to tsm_mr, and SPDM fits neither.

This series adds a common attestation subsystem. Its goal is to support
platform, TEE and device roots of trust through one model, including
TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed
devices, so that a program extends a register or asks for evidence
without knowing the hardware behind it. This first series implements
the common subsystem and a TDX provider. The native TDX interfaces,
/dev/tdx_guest, tsm_report and tsm_mr, stay as they are.

RFC v1 [1] posted this and CTLV as one patchset. For convenience, v2
splits it in two, and this series applies on top of the CTLV series,
posted alongside as

  [PATCH RFC v2 00/15] ctlv: Add a schema-driven TLV uAPI for character devices

Each attestation device has a node, /dev/attestation/attestationN,
that speaks CTLV: a request is checked against the family's schema and
executed at once, rather than assembled through several files. The
base family, ctlv-attestation, has what every provider shares, so a
tool written against it works with any provider. TDX's family,
ctlv-attestation-tdx, inherits it and adds no ops. It fills the base
family's extension points: device-get's info with the TD's MRCONFIGID,
MROWNER and MROWNERCONFIG, and evidence-vendor-format with the two TDX
Quote formats.

The base family's ops, as ctlvgen --signatures prints them, with the
purpose of each:

  # What the device supports, fixed for its life, and its family's fields.
  device-get() ->
      { caps: { evidence?: { objects[16]: { id, class, formats[4]?,
                                            vendor-formats[4]?, max-length,
                                            challenge-lengths[8]?: { length?,
                                                                     min-length?,
                                                                     max-length? } } },
                mr?: { flags } }, info: device-info }

  # Evidence: each object named, written to a blob the caller supplies,
  # a signed one made by the call over the challenge.
  evidence-get(challenge?, objects[16]: { id, data: out blob }) ->
      { results[16]: { format?, vendor-format?, length }, mr-generation? }

  # Describe every MR, or the one an ID names.
  mr-get(id?) -> { items[]: { id, mr-desc } }

  # One MR's values, a digest per bank, and the MR generation they
  # reflect.
  mr-read(id) -> { mr-generation, mr-values[hash-algo]: mr-value }

  # Extend banks of one MR by the caller's digests.
  mr-extend(id, mr-values[hash-algo]: mr-value) -> { mr-generation }

An mr-desc is an MR's name, its banks, what it allows and its register
index, and an mr-value one bank's hash algorithm and digest. The
userspace ABI gives each op's request, reply, errors and access.

On TDX, evidence-get returns the Quote over a 64-byte challenge,
labelled a legacy or a DICE one, and, where ACPI describes it, the
CCEL event log. The MRs are MRTD, which cannot be extended, and RTMR0
to RTMR3, all SHA-384. With ctlvctl from the CTLV series and
CTLV_SPEC_DIR pointing at Documentation/ctlv/specs, the simulator's
output, rewritten for a TD, its lengths left out:

  # The device and its family chain.
  $ ctlvctl list
  attestation/attestation0        ctlv/ctlv-attestation/ctlv-attestation-tdx

  # What it supports.
  $ ctlvctl exec attestation/attestation0 device-get
  # device-get, 1 fragment, generation 0
    device-get caps
      device-get caps.evidence
        device-get caps.evidence.objects
          device-get caps.evidence.objects.id 0
          device-get caps.evidence.objects.class signed
          device-get caps.evidence.objects.vendor-formats quote
          device-get caps.evidence.objects.vendor-formats quote-dice
          device-get caps.evidence.objects.max-length 131048
          device-get caps.evidence.objects.challenge-lengths
            device-get caps.evidence.objects.challenge-lengths.length 64
        device-get caps.evidence.objects
          device-get caps.evidence.objects.id 1
          device-get caps.evidence.objects.class event-log
          device-get caps.evidence.objects.formats ccel
          device-get caps.evidence.objects.max-length ...
      device-get caps.mr
        device-get caps.mr.flags extend
    device-get info
      device-info.mrconfigid hex:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      device-info.mrowner hex:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
      device-info.mrownerconfig hex:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

  # A Quote over a 64-byte nonce, written to quote.bin.
  $ nonce=$(openssl rand -hex 64)
  $ ctlvctl exec attestation/attestation0 evidence-get --json \
          '{"challenge":"hex:'"$nonce"'",
            "objects":[{"id":0,"data":{"file":"quote.bin"}}]}'
  # evidence-get, 1 fragment, generation 0
    mr-generation 0
    evidence-get results
      evidence-get results.vendor-format quote
      evidence-get results.length ...

  # Every MR.
  $ ctlvctl exec attestation/attestation0 mr-get
  # mr-get, 1 fragment, generation 0
    mr-get items
      mr-get items.id 0
      mr-desc.name mrtd
      mr-desc.supported-hash-algorithms HASH_ALGO_SHA384
      mr-desc.caps 0
    mr-get items
      mr-get items.id 1
      mr-desc.name rtmr0
      mr-desc.supported-hash-algorithms HASH_ALGO_SHA384
      mr-desc.register-index 0
      mr-desc.caps extend
    ...

  # The value of RTMR0, MR 1.
  $ ctlvctl exec attestation/attestation0 mr-read id=1
  # mr-read, 1 fragment, generation 0
    mr-generation 0
    mr-values
      mr-value.hash-algo HASH_ALGO_SHA384
      mr-value.data hex:b57a300eac0c9b8593bafbadee812f8915456913c28010dab20d700446169bdd56e1af87ce94d66c8fd2d456b3e42826

  # Extend RTMR3, MR 4, by a file's SHA-384 digest.
  $ digest=$(sha384sum app.img | cut -d' ' -f1)
  $ ctlvctl exec attestation/attestation0 mr-extend --json \
          '{"id":4,"mr-values":[{"hash-algo":"HASH_ALGO_SHA384",
                                 "data":"hex:'"$digest"'"}]}'
  # mr-extend, 1 fragment, generation 0
    mr-generation 1

This series is the first part. The branch [2] has the whole work,
building on it: CTLV's events, the MR journal with IMA as its first
user, memfd and dma-buf evidence blobs, an mr-extend that hashes the
caller's data, evidence acceptance and device security, a simulation
provider, KUnit tests and selftests.

The series adds 3480 lines:

  attestation core, C               1340
  generated files                    770
  TDX provider, C                    470
  docs                               462
  family specifications              206
  ABI snapshots                      170
  registry, build                     62

Changes since RFC v1, each patch listing its own:

- Each evidence object has an ID, a class, signed or event-log, and
  the formats it may have: from evidence-format for a layout a
  standard defines, from evidence-vendor-format, whose values the
  device's family gives, for a vendor's. A signed object lists the
  challenge lengths it takes.
- evidence-get names objects by ID, may omit the challenge, and takes
  output blobs of any length, failing with the length one needs.
- TDX labels each Quote, returns the CCEL log, and leaves the
  TDREPORT to /dev/tdx_guest.
- The MR journal and its notifications are left out, until IMA uses
  the subsystem.
- mr-extend may extend some of an MR's banks, and every MR can be
  read.
- mr-get, a query, describes every MR or the one its optional id
  names, and mr-dump is gone.
- Attestation has its own class and /dev/attestation/ nodes, and the
  TDX provider is part of tdx-guest instead of a module of its own.
- The specs are written as op trees and records, with a comment on
  every item, and a userspace ABI document describes the family.

The patches:

  1      the base family's specification and generated files
  2      the userspace ABI
  3-5    the provider and instance core, the MRs, and the CTLV ops
  6      how to write a provider
  7      tdx-guest's native attestation service, for the provider
  8-9    the TDX family's specification and implementation

Note to reviewers: the uAPI, in 1 and 2, and the provider API, in 3
and 6, matter most at this stage.

[1] https://lore.kernel.org/all/20261015145053.3664509-1-jiri@resnulli.us/
[2] https://github.com/jpirko/linux_mlxsw/commits/wip_attestation_all_2

Jiri Pirko (9):
  attestation: Add the base family specification and generated files
  Documentation: attestation: Add userspace ABI
  attestation: Prepare provider and instance core
  attestation: Prepare measurement registers
  attestation: Add CTLV operation handling
  Documentation: attestation: Describe how to write a provider
  tdx-guest: Expose the native attestation service API
  attestation: Add the TDX family specification and generated files
  attestation: Add the TDX family implementation

 .../ctlv/abi/ctlv-attestation-tdx.yaml        |  21 +
 Documentation/ctlv/abi/ctlv-attestation.yaml  | 147 +++++
 Documentation/ctlv/abi/families.registry.yaml |   2 +
 Documentation/ctlv/families.yaml              |   2 +
 Documentation/ctlv/generated-files.yaml       |  14 +
 .../ctlv/specs/ctlv-attestation-tdx.yaml      |  25 +
 .../ctlv/specs/ctlv-attestation.yaml          | 181 +++++++
 Documentation/driver-api/attestation.rst      |  99 ++++
 Documentation/driver-api/index.rst            |   1 +
 .../userspace-api/attestation-tdx.rst         |  59 +++
 Documentation/userspace-api/attestation.rst   | 294 ++++++++++
 Documentation/userspace-api/index.rst         |   1 +
 Documentation/virt/coco/tdx-guest.rst         |   8 +
 MAINTAINERS                                   |  13 +
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/attestation/Kconfig                   |  16 +
 drivers/attestation/Makefile                  |   5 +
 drivers/attestation/core/core.c               | 500 ++++++++++++++++++
 drivers/attestation/core/ctlv.c               | 499 +++++++++++++++++
 drivers/attestation/core/internal.h           |  34 ++
 drivers/attestation/core/mr.c                 |  64 +++
 .../generated/ctlv_attestation_gen.c          | 179 +++++++
 .../generated/ctlv_attestation_gen.h          | 204 +++++++
 drivers/virt/coco/tdx-guest/Kconfig           |   4 +-
 drivers/virt/coco/tdx-guest/Makefile          |   6 +
 drivers/virt/coco/tdx-guest/attestation.c     | 313 +++++++++++
 .../coco/tdx-guest/ctlv_attestation_tdx_gen.c |  65 +++
 .../coco/tdx-guest/ctlv_attestation_tdx_gen.h |  44 ++
 drivers/virt/coco/tdx-guest/internal.h        |  48 ++
 .../coco/tdx-guest/{tdx-guest.c => main.c}    | 137 ++++-
 include/linux/attestation.h                   | 243 +++++++++
 include/uapi/ctlv/ctlv_attestation_gen.h      | 234 ++++++++
 include/uapi/ctlv/ctlv_attestation_tdx_gen.h  |  42 ++
 include/uapi/ctlv/ctlv_families_gen.h         |   2 +
 35 files changed, 3480 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/ctlv/abi/ctlv-attestation-tdx.yaml
 create mode 100644 Documentation/ctlv/abi/ctlv-attestation.yaml
 create mode 100644 Documentation/ctlv/specs/ctlv-attestation-tdx.yaml
 create mode 100644 Documentation/ctlv/specs/ctlv-attestation.yaml
 create mode 100644 Documentation/driver-api/attestation.rst
 create mode 100644 Documentation/userspace-api/attestation-tdx.rst
 create mode 100644 Documentation/userspace-api/attestation.rst
 create mode 100644 drivers/attestation/Kconfig
 create mode 100644 drivers/attestation/Makefile
 create mode 100644 drivers/attestation/core/core.c
 create mode 100644 drivers/attestation/core/ctlv.c
 create mode 100644 drivers/attestation/core/internal.h
 create mode 100644 drivers/attestation/core/mr.c
 create mode 100644 drivers/attestation/generated/ctlv_attestation_gen.c
 create mode 100644 drivers/attestation/generated/ctlv_attestation_gen.h
 create mode 100644 drivers/virt/coco/tdx-guest/attestation.c
 create mode 100644 drivers/virt/coco/tdx-guest/ctlv_attestation_tdx_gen.c
 create mode 100644 drivers/virt/coco/tdx-guest/ctlv_attestation_tdx_gen.h
 create mode 100644 drivers/virt/coco/tdx-guest/internal.h
 rename drivers/virt/coco/tdx-guest/{tdx-guest.c => main.c} (79%)
 create mode 100644 include/linux/attestation.h
 create mode 100644 include/uapi/ctlv/ctlv_attestation_gen.h
 create mode 100644 include/uapi/ctlv/ctlv_attestation_tdx_gen.h

-- 
2.56.0

