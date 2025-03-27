Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F7C19D882
	for <linux-coco@lists.linux.dev>; Thu, 27 Mar 2025 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093352; cv=none; b=WiqolJalZdlav9IGRn2mZyTCRxy25ZOPs70DE6mimdmQlYXBVw+LYM5M5baKQ8PYZ8fkfgNmsnEofOlVwtK/6pVyn3pqRruEbdofYnSW/qnr1W4r95g+dxraroYdyIZ9Ajyh6ZDhb4WZP9AOi2eBTtOeVbnDoAD8rhU/Did3jkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093352; c=relaxed/simple;
	bh=eX7fgUh0Or+r6nCoeg2ASG+YN/fSSE0v52AVH35g1rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTJhXLgobLgta2uiq93PjJz3MjA7dDAoliqAoMEA98R4I+/UTy3Sf+elu7Smuj53jFO1xNMw39oc2cf3z+l93voP4YmeFsieguKJBMucg1yy85K3iNUej111fn9o5XbAZECpBRk+tVcHmM+sg+9RyVI7hgLDjmMC2wKDspQ0oo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=JcsgTWON; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JcsgTWON"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso4148635a12.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Mar 2025 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093348; x=1743698148; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0w6uuCADAEtLYg3qcYN8l4lvMJUAkHjqpfFuC5QFZE=;
        b=JcsgTWONWZP2lXmpYrfw/238V0fL1+jPAm2xBKRHseCu0eJ1C+sdz55pGxafUW8mVe
         /54wRDr2DOK+fofyFBLv+O7usVdti0YCXAwYqwAoSX7U5201ppVxPk7qk2jLuqWLJ7Rx
         Zbvul4GPSbB6IQouUCd4JsYEjXCEJG5vg4x7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093348; x=1743698148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0w6uuCADAEtLYg3qcYN8l4lvMJUAkHjqpfFuC5QFZE=;
        b=M6MWfWnklPfq2L/EM6iYtryzGK8pyefojixl2+xoRHsWY5ElaYSRCjPSiMx0LJWJv2
         amhdQspRTZCeh2snwnSwGWbcxhstPql3yqfh1zyefPFXKhpD0pupu9KeuFwJw5lWawh4
         9Sr8rju6w/4ZL9CNj2qMfK32nKkbLWpp2o3n4O9+WXA8x5ZbvMFPF2euSXhb/lJ9ZPs3
         cKfy2NYkfNYt+ymUqacvNSerBNSt+Vq+x8tuLJo1R1T1RjiQYL3iRFIvs8yrpuOZP/zn
         dLZL/ErUCYRz2qDe4NP+5qGnhbSdOIbjDMN0YPXL0O5k8TAAoyNVnW5O4GS4Iqz2XHpG
         PTXw==
X-Forwarded-Encrypted: i=1; AJvYcCVt33iDQdsCc/d62dQ3G5qL+mBwQIwEfmfBRP01AjWOntvThVXJ3+vm8IM6ke0KCJz58MQKJh0atcdk@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkr0WOQCIN27slcZ4J7rDCZdxMgp0IRWEXOReSrpGjvj0TLVkw
	w12UmfeHI7lN56A1T64gDLCv4CDPXYYQMQkWj4kLeoLvYJXfdWFlpruV6DsNG0I=
X-Gm-Gg: ASbGncvR0O314PgYltw85jn1taE+wMzdJjpKW/qOSDU75FhFor6gewLSJoGJ+BzTLx/
	QPmo0ywuCwJZtd1qT5x0T3Hph6+6yIg8k/XGnp2x5a/g+/xEDKYAiKayl+z5p74CcwtDQTA1yDy
	VpXsmD1ddOMlK3IgkBBjFeFN0afpp/vjKjidwV34WbvdMStnNYw9M2RqvdHqhYeKYy9QEY4kkik
	pBJXu/zDPS7xuhyHb39A/qbXKi7QkSzAOSdsJKkB5Z+F6DLORz/c+MmcluJw0sloQz6a5CzZwWf
	KphU6KHqKyxVeq7uUAUSsuqM+OSWS4t8ieG7k5mSMwjKEAO6dA==
X-Google-Smtp-Source: AGHT+IHEvJFXsIv1KX0tOnrc1aD6jz56SsUPbPYvgNk+VtOonHYfrD/l+1uybG5HnmfkDNHxapuKvg==
X-Received: by 2002:a05:6402:90b:b0:5e5:9c04:777 with SMTP id 4fb4d7f45d1cf-5edbf31f039mr799501a12.6.1743093347754;
        Thu, 27 Mar 2025 09:35:47 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc16aae16sm54762a12.13.2025.03.27.09.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:35:47 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:35:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: bhelgaas@google.com, tglx@linutronix.de, jgross@suse.com,
	pstanner@redhat.com, andriy.shevchenko@linux.intel.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH] PCI/MSI: Fix x86 VMs crash due to dereferencing NULL
Message-ID: <Z-V-YkXwHQsqUBnm@macbook.local>
References: <20250327162155.11133-1-Ashish.Kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327162155.11133-1-Ashish.Kalra@amd.com>

On Thu, Mar 27, 2025 at 04:21:55PM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Moving pci_msi_ignore_mask to per MSI domain flag is causing a panic
> with SEV-SNP VMs under KVM while booting and initializing virtio-scsi
> driver as below :
> 
> ...
> [    9.854554] virtio_scsi virtio1: 4/0/0 default/read/poll queues
> [    9.855670] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [    9.856840] #PF: supervisor read access in kernel mode
> [    9.857695] #PF: error_code(0x0000) - not-present page
> [    9.858501] PGD 0 P4D 0
> [    9.858501] Oops: Oops: 0000 [#1] SMP NOPTI
> [    9.858501] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-next-20250326-snp-host-f2a41ff576cc #379 VOLUNTARY
> [    9.858501] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 02/02/2022
> [    9.858501] RIP: 0010:msix_prepare_msi_desc+0x3c/0x90
> [    9.858501] Code: 89 f0 48 8b 52 20 66 81 4e 4c 01 01 c7 46 04 01 00 00 00 8b 8f b4 03 00 00 48 89 e5 89 4e 50 48 8b b7 b0 09 00 00 48 89 70 58 <8b> 0a 81 e1 00 00 40 00 75 25 0f b6 50 4d d0 ea 83 f2 01 83 e2 01
> [    9.858501] RSP: 0018:ffffa37f4002b898 EFLAGS: 00010202
> [    9.858501] RAX: ffffa37f4002b8c8 RBX: ffffa37f4002b8c8 RCX: 0000000000000017
> [    9.858501] RDX: 0000000000000000 RSI: ffffa37f400b5000 RDI: ffff984802524000
> [    9.858501] RBP: ffffa37f4002b898 R08: 0000000000000002 R09: ffffa37f4002b854
> [    9.858501] R10: 0000000000000004 R11: 0000000000000018 R12: ffff984802924000
> [    9.858501] R13: ffff984802524000 R14: ffff9848025240c8 R15: 0000000000000000
> [    9.858501] FS:  0000000000000000(0000) GS:ffff984bae657000(0000) knlGS:0000000000000000
> [    9.858501] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.858501] CR2: 0000000000000000 CR3: 000800003c260000 CR4: 00000000003506f0
> [    9.858501] Call Trace:
> [    9.858501]  <TASK>
> [    9.858501]  msix_setup_interrupts+0x10e/0x290
> [    9.858501]  __pci_enable_msix_range+0x2ce/0x470
> [    9.858501]  pci_alloc_irq_vectors_affinity+0xb2/0x110
> [    9.858501]  vp_find_vqs_msix+0x228/0x530
> [    9.858501]  vp_find_vqs+0x41/0x290
> [    9.858501]  ? srso_return_thunk+0x5/0x5f
> [    9.858501]  ? __dev_printk+0x39/0x80
> [    9.858501]  ? srso_return_thunk+0x5/0x5f
> [    9.858501]  ? _dev_info+0x6f/0x90
> [    9.858501]  vp_modern_find_vqs+0x1c/0x70
> [    9.858501]  virtscsi_init+0x2d2/0x340
> [    9.858501]  ? __pfx_default_calc_sets+0x10/0x10
> [    9.858501]  virtscsi_probe+0x135/0x3c0
> [    9.858501]  virtio_dev_probe+0x1b6/0x2a0
> ...
> ...
> [    9.934826] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
> 
> This is happening as x86 VMs only have x86_vector_domain (irq_domain)
> created by native_create_pci_msi_domain() and that does not have an
> associated msi_domain_info. Thus accessing msi_domain_info causes a
> kernel NULL pointer dereference during msix_setup_interrupts() and
> breaks x86 VMs.
> 
> In comparison, for native x86, there is irq domain hierarchy created
> by interrupt remapping logic either by AMD IOMMU (AMD-IR) or Intel
> DMAR (DMAR-MSI) and they have an associated msi_domain_info, so
> moving pci_msi_ignore_mask to a per MSI domain flag works for
> native x86.
> 
> Also, Hyper-V and Xen x86 VMs create "virtual" irq domains
> (XEN-MSI) or (HV-PCI-MSI) with their associated msi_domain_info,
> and they can also access pci_msi_ignore_mask as per MSI domain flag.
> 
> Fixes: c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag")
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

Sorry for the breakage.  Already fixed upstream by commit:

3ece3e8e5976 ("PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends")

From Thomas.

Regards, Roger.
