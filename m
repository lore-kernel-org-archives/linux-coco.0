Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE793480341
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664683; cv=none; b=E4GXfXe4l1I5Cio5pQJeYoXX82iawfhAeOI7fOB/IpQ5KRWvY+lubewvwFmwLdrY5rmH0g66yPwgYfl6eOQQTM8e75kOyqHUu6u87QtLhhzMgTeOn6DtrT5K4HhG7y5QZP9rWnXWw2CxMEZXTdLGKDJ+qRejGToAzf8zcEE+vRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664683; c=relaxed/simple;
	bh=6FzKXwp+dR8NiionnviS33tPSKmxD/OLjwV6jirP7lU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bKJqk9lmPkQxr+7XUAe+oBuGNbCttPbj2zkdJIWcQlVGmFMMQpOFpZMNsgnYKmtqcYudn48EofHYqqsfgFH/4ykFfV9I4Tdqwzpx9ji+B7Fb+IdXb/EOfeUf0DcN3KS4kl7gZfnfnNJVBvkZjmTzX5caWW//L51Wsysid8iZsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RTI3MWPZ; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RTI3MWPZ"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso7552303a12.2
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787664681; x=1788269481; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKSXRuaVLFrzkymJkeDqbMbN6zJt7kGbPsTEn0x+kNo=;
        b=RTI3MWPZCrwL0O2oXbTNHRVvbdhuu7J1EK17zmKjEMre322cs0duWC3Aj6vmIYInKh
         dgD2egTMSDkrZkDUQe3tiV0Gz2+van4poxzt6QFP9QsUOY+/ACnRRj7i0+ciW38k2JuG
         /kzt22iEoMc3HvWxomgmGklW7c4BucwbQmAGnyR+zeFjpxdCNCXiBI6vkGbrQuNrRg/d
         2tnE+QJD4mfzvEWTY7vlA8Pj8X+sXC9uBGs4Vl3N55gE4cKiC5L3bDTi2rCdDcD5IrHz
         8IAQ1M7oURq41NCYFSvi6t+G3qQynVREJy1MnNv9jwOuKOxVPe/JlaonSOILgXzyMZok
         NLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664681; x=1788269481;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKSXRuaVLFrzkymJkeDqbMbN6zJt7kGbPsTEn0x+kNo=;
        b=bETp5R0ZgKplrYQa4Ro1TEemtf4CvwBPL4Hh3ifxlZrRjpJln4hBPevUEuc6cs8Yzb
         0fKWo/wDy/UdSIRlmipRArISUV1hRwlMk8zNzDoCzUhihrcE9rh8a+VsR3IWKg798HZ6
         JQ0o/5McKrMhgXX6H1oWvCeefBajujSvtnjbKfdHrhlMNUguk5tFFRmJ9sioYvOchj9T
         jvH3EDKHAgEm7/G5gfsWMbYzuwfcNdVo7msWxF1nM2qPhpsMiPwYOyiuQ/TlEimLr8xt
         IF68IAVubWRKR1CWAvf2SdyiTHCwWeaPVZwu1PPLqSJV593K1QTEvfeQuTUGeDflpXkW
         J+bQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7iu6SRDmj5cClMRHdZLwPYrb/PJAxzTFtMFQ+aaMIZl4Qi6WtqOh/+wbclsMsl8zEo205viZbgXpV@lists.linux.dev
X-Gm-Message-State: AFuF++nD5s9faOU68e54oa7P2O0n7K7wdcR/hbcmeiRTt5fT3CUgy5zl
	S0sI6d6akIcbzh2SbPiFpOkVaju10oSiCRmRHw8R/KPrCe34oCTh58oKmQYvDjZxIiX+ZB6XBvw
	dzYafqg==
X-Received: from pgch31.prod.google.com ([2002:a05:6a02:509f:b0:c9e:3c0b:5818])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:134b:b0:3c4:396d:4a6c
 with SMTP id adf61e73a8af0-3cd910a2c53mr15074204637.5.1787664680841; Tue, 25
 Aug 2026 06:31:20 -0700 (PDT)
Date: Tue, 25 Aug 2026 06:31:11 -0700
In-Reply-To: <20260825025533.25663-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260825025533.25663-1-yan.y.zhao@intel.com>
Message-ID: <ao2ZH8dmkPfBDnGv@google.com>
Subject: Re: [PATCH] x86/virt/tdx: Warn on !4K level in tdh_mem_page_aug()
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: kas@kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	rick.p.edgecombe@intel.com, pbonzini@redhat.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, kai.huang@intel.com, yilun.xu@linux.intel.com, 
	vannapurve@google.com, ackerleytng@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, 
	Dave Hansen <dave.hansen@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 25, 2026, Yan Zhao wrote:
> Add a warning on a !4K level to loudly flag the unexpected condition when
> callers pass in a level > 4K before tdh_mem_page_aug() supports huge pages.
> 
> The warning makes the unexpected condition more obvious since the SEAMCALL
> TDH_MEM_PAGE_AUG does not necessarily fail when the level is above 4K,
> while tdh_mem_page_aug() only flushes the cache for a 4K page before huge
> page support is added.

If the only problem is the lack of CLFLUSH coverage, why not simply fix the
bug?  The changelog spends more effort justifying not fixing a bug than it would
take to fix the bug.

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 42df8ea464c4..1a83857eb7e6 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1628,9 +1628,9 @@ static void tdx_clflush_page(struct page *page)
 	clflush_cache_range(page_to_virt(page), PAGE_SIZE);
 }
 
-static void tdx_clflush_pfn(kvm_pfn_t pfn)
+static void tdx_clflush_pfn(kvm_pfn_t pfn, enum pg_level level)
 {
-	clflush_cache_range(__va(PFN_PHYS(pfn)), PAGE_SIZE);
+	clflush_cache_range(__va(PFN_PHYS(pfn)), page_level_size(level));
 }
 
 static int pg_level_to_tdx_sept_level(enum pg_level level)
@@ -1670,7 +1670,7 @@ u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, kvm_pfn_t pfn, struct page *sou
 	};
 	u64 ret;
 
-	tdx_clflush_pfn(pfn);
+	tdx_clflush_pfn(pfn, PG_LEVEL_4K);
 	ret = seamcall_ret(TDH_MEM_PAGE_ADD, &args);
 
 	*ext_err1 = args.rcx;
@@ -1722,7 +1722,7 @@ u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, enum pg_level level,
 	};
 	u64 ret;
 
-	tdx_clflush_pfn(pfn);
+	tdx_clflush_pfn(pfn, level);
 	ret = seamcall_ret(TDH_MEM_PAGE_AUG, &args);
 
 	*ext_err1 = args.rcx;
