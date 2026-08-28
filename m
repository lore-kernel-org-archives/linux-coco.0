Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410973BED75
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948051; cv=none; b=dnI8dIwDD4tP+4xORvIAq0EJytwVrdfn4ElFj3miAIix/4/3aP8/pkW7/rHFLOQdIMwGhzLTkbBs+NjwYkWGJYnvcHuPkJhc3wg8L0HwjU+eT9y2QuMetkRddTG1bXBZ1R9uBQB5KlCfcDFBkMYnP2Mh3vtqYOiXkWoPoiQSj1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948051; c=relaxed/simple;
	bh=RrlgIjKQtS2iaNVqkTRdRTy02FrfZJ1ASwUAxdnue2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WigLn+my+7YuegiFpPPfSLGbQisRQ9ceUp7F1I4zqDTzHxWaPYvHqeNPrnXy/GeVc5NtmRPyG3wHAIlHe4r4BHRIhRLYQenQ4YGQ3y5xVstBeeNoTkTZA2uIKpqySHD6CSDw8Yywz9JYaBVb+vk8lMYTUCk9jmK59iAy0nonbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a79OEAyh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a79OEAyh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d3b440b97aso5345ad.1
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948049; x=1788552849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1W99GsbYdan7e4eL7ZVdhDx98mSTGYMmyZJimSzUaX0=;
        b=a79OEAyhqTolfhRUr0EUob9kGMPriSjBpQndOkOBKTx+x5BNB1Ku9b7DYLMmtaFU7p
         OxooqfmS88syASenPBPj0TGv2nu5p0PtZpDjn/1VIVyv3/d0CX68JbjAsxUU9IWCqcId
         0zBcjIY5RptCbNZ6s2T0lreVenrek/1vLRfn8rly5kDxN9DwqnBpnhs5Pes3bzUCqf8C
         L9W8c3yyQNKmhjpIDElgqVfbn0xtvfU22ocrU3aEzV67rsze1xYgRKY2V8Vg80NGjTXk
         FCbeDz6nHcvITEwXw9fJj70Z/UA1AkoPpKufPGvVuDMYsbkjLegEjGRY9CUmlCMmW+CJ
         wvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948049; x=1788552849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W99GsbYdan7e4eL7ZVdhDx98mSTGYMmyZJimSzUaX0=;
        b=ViHM83isT0Y/63SizmTTyZZnKYduznoUJdXUYLuFNIuCSm7QQUdWjhn32xK6plwk/A
         PPntgNxBX747YBb6aLllVIXzyFm1bwjsrJMROBgooMtZrPU9qo20akaiSQZWiTBPn0DR
         ZftYFP7qGnMf7beFG2DDCybPQQy05bMXLRZEFPW6BkFZzWZ3zr3Wyg4URtDlrPWn8b/6
         u5L/cSzIXtTC0t6+7BADu99znerEIIuqnh11jKZbuzLdZ41gh/dRnvXrLT9mlK2CARdt
         voxkt442s1Z04CVwLz1c1ceKNtbV5MRXC7RxpQy73OaDoNVF1P2KSFjPgDn/h6wSACW5
         Uxlw==
X-Forwarded-Encrypted: i=1; AKwUvBzf038qRY3clSPuuYi0JpBFYQ3UJCssm3zOAwY8+jHCoKKQCf0263E72JBgoj/evROm1SrB5BFYgG2s@lists.linux.dev
X-Gm-Message-State: AFuF++lwwoQAB/D85/HSfTKlG+MLfAuPlB9pPEMb3WxfLF22xOYe/SlT
	Q8Bf9CLt6xYsk5MVVaMy4lRg3wpvEzgxiduXd8Bx6/I9CgIlfS8XkPjCLq0JnrrS2Q==
X-Gm-Gg: AYBFou1fS9yDlbv+vYKm9gtWqizxP07lYb1hy/nb6kh8zq/H9FE07IBmRzsdBfpLdeV
	vifol/fl/RON6HS6UJxOs3bl7gd1IrnT7pE5FyV0Ha+1tYnz87EY1Siy9T/Ss1lmVmtJQy5WoIU
	77Nk2OY0jYPBzdo87sRR7iK40yGp60iBUdhoO2w+nzvnDA/vDI4W2PYfw4x1UTnJKBpeHRl0Mpb
	M4ZpSe7rpp4nqbQLNm3CuO6QxMFYcYWfMWTiIvPcQkxg/tMObESjZBr0/vOanqeWUiEpTrCtdbV
	XhAftZPdK1AvEy4NPsJvm00sYj4x23GvUaHkq/9mzBVpRtfR4NfpbXL8Q5U96CTTC2vIFtHyVDz
	c/9E0eSFGXYZBdNLO79leue4a/Oso+HOuDCfUKzUu1FchfCBUdc987aGGC6UktcC76bK/L9AOOv
	oxYgdQTkUJ5TFVmCOyWye3xOukeGN26t8syEzBJpk01K3snQ8uvulW9uST8EwiQg0i2ripvXo9f
	44owG1qyggEQQrAROCqa/w/
X-Received: by 2002:a17:902:f642:b0:2d5:db38:800f with SMTP id d9443c01a7336-2d8df554483mr1432235ad.14.1787948049010;
        Fri, 28 Aug 2026 13:14:09 -0700 (PDT)
Received: from google.com (139.58.247.35.bc.googleusercontent.com. [35.247.58.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759869cfdsm8784715ad.51.2026.08.28.13.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 13:14:08 -0700 (PDT)
Date: Fri, 28 Aug 2026 20:14:04 +0000
From: Lisa Wang <wyihan@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Fang <peter.fang@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
	Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 10/22] KVM: selftests: Set up TDX boot code region
Message-ID: <apHsDCRHG-QIYZuL@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-10-15ad654a50db@google.com>
 <20260824192702.GA3694338@pedri>
 <aoyi4nhWkhFrlIfs@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyi4nhWkhFrlIfs@google.com>

On Mon, Aug 24, 2026 at 01:00:34PM -0700, Sean Christopherson wrote:
> > 
> > There shouldn't be a need to "pad reset_vector to its full size of 16
> > bytes" as stated in v8 [1]. The exported "reset_vector" symbol in v8,
> > plus the boot code start & end markers, should be enough to help
> > tdx_vm_setup_boot_code_region() put this boot blob in the right place.
> 
> Ya, looking at this with fresh eyes, AFAICT there's no reason to handcode anything,
> it's just basic arithmetic.
> 
> Side topic, this series doesn't compile for me, so the below isn't even properly
> compile-tested (I hacked in arbitrary literals to get past the undefined references).
> 
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:(.text+0xf): undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:(.text+0x17): undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:(.text+0x1d): undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:(.text+0x26): undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:(.text+0x2f): undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:(.text+0x38): undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:(.text+0x41): undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/x86_64-linux-gnu-ld.bfd: tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:(.text+0x51): undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
The patch series posted here on the mailing list is correct,
but I made a one-line mistake when pushing the code to the
GitHub branch. I have just force-pushed the fix to the branch.
It should compile correctly now. Please let me know if you
run into any further compilation issues.

I will test this change on my side. Thanks!

Lisa
