Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A02330647
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649379; cv=none; b=e665p+Ibor379amuFUvR+h0/30YEcIJjpT+k/jZo5+6a2ggaXQsNBIEHtnsC+eqmMRC+8kHcr9gZayo/3YiqYEQqLHquZmkPvgBPFOLvGWgsqc/ZwdWFqT1PX8zUr+Chco0leR3D6t7t5HGLxr06+UfAaNmiJXDWht4VgBz5x7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649379; c=relaxed/simple;
	bh=2AFN/urgPi8sHxS0ED+9ecVsZaZqGadZaHDApgUZnpM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AoEWOOE7xzGDcEmh1tIR/0iULpaciMYXbzf1W+3AClY3zoDm3ZGVe/JBP+qeSF0lvaQqQx4Y05faBjjyYo1QN09zg4V3GFc1aZQ8iSNbaB+NkfPm+bjNKilJNnm5GwdgmLN2HAUaOdl/Cq1f5WF8SnkNVtpe44bih2eTKtZkkOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KgwHxqLg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KgwHxqLg"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so289613a91.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649377; x=1770254177; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=80B6pHXYnPFCaLMTncYxaAMN7FbDOTiyI0xEQDWm1fU=;
        b=KgwHxqLglPAjifMGrzNgw6lD8Igt4bW6v9e3aWwpyblHacQyBO8igqYGyfOkFaRKBg
         Gm1i3gDRBlEP0T2ynGA2oeZPcd7sq5z3ZDc+fe9Q89KsxXo+xURcxlpSdosnu/zQgKvk
         ukSNeqptCvaj9aQmPT1CtdFtmyt/+ymQOjOhpgO/4bqdxjRX6jS8wfzmufs9VnkkTxED
         DAPJAyYmg4ATuZ4f+L8DnNzjBQVnSd40PLpABAXmkFnJ5Ut1fjy9nUE2H9rVfx5DHJ1y
         gJw8W2agxy0aSvNIszLyeYJl2Zr5gGI+MUU4BAPwLLt7+bGxfkrXZLEM/RvbMHI8M4LR
         zOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649377; x=1770254177;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80B6pHXYnPFCaLMTncYxaAMN7FbDOTiyI0xEQDWm1fU=;
        b=uNQmq62Xb1KZ3OZt1b5pU7nvnfs3kHz051NR9QdMjBEqUkFXhARCafsCpSqRM19qoS
         m3+0Jr3QiyiasPiVPsL+X+5bXHUF8+YLl7rI0ggK4uDTni40T7EmsoIz2b4ABFHy80uZ
         Mngt8/w5/VAbcoC742w9qNRivJr4h5vR/SkqKlAD/Jw8kVwJOPMV2lZlyQEq+DkhrSNp
         /vYTAZT1b/u4M0uf4tElqCxIkqbGhZAhOjR2h/3104Iuq+q0caVG77rVPVmFctwS66rQ
         dqjrLg9Y6Sv1scngs1hGWbSTcZnAxjCrQH5+M8smXAp7d8iKLiUuJcQwtLFanWT+ioqb
         80wA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Wk8z5LxlmpzK/+5DHTSOwBwK9Si+MIrA9wvfsiZivbgHPU2J8KKaWftbFWUlnsbMRGrEWRRI4cUE@lists.linux.dev
X-Gm-Message-State: AOJu0YwQdyDFn0XlrsTOj3+0diWdJyxYlcS2nclKfpVxDa93C6CA1knV
	c2U46avXv6ZPLiTECWHXoXSgn/aS+ayzNesOq/OiCLg+PtiTnNOekhIPidUD/Q2iwcVG3rSJDkA
	+qOcF+w==
X-Received: from pjbos4.prod.google.com ([2002:a17:90b:1cc4:b0:34a:c87f:a95a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88c:b0:340:9cf1:54d0
 with SMTP id 98e67ed59e1d1-353fecca19emr6398135a91.1.1769649377470; Wed, 28
 Jan 2026 17:16:17 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:58 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-27-seanjc@google.com>
Subject: [RFC PATCH v5 26/45] x86/virt/tdx: Enhance tdh_mem_page_aug() to
 support huge pages
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Yan Zhao <yan.y.zhao@intel.com>

Enhance the SEAMCALL wrapper tdh_mem_page_aug() to support huge pages.

The SEAMCALL TDH_MEM_PAGE_AUG currently supports adding physical memory to
the S-EPT up to 2MB in size.

While keeping the "level" parameter in the tdh_mem_page_aug() wrapper to
allow callers to specify the physical memory size, introduce the parameters
"folio" and "start_idx" to specify the physical memory starting from the
page at "start_idx" within the "folio". The specified physical memory must
be fully contained within a single folio.

Invoke tdx_clflush_page() for each 4KB segment of the physical memory being
added. tdx_clflush_page() performs CLFLUSH operations conservatively to
prevent dirty cache lines from writing back later and corrupting TD memory.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
[sean: remove the page+folio assumptions]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/virt/vmx/tdx/tdx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 85c31ed9b9d1..37776ea56eb7 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1756,9 +1756,13 @@ u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, enum pg_level level, u64 pfn,
 		.rdx = tdx_tdr_pa(td),
 		.r8 = PFN_PHYS(pfn),
 	};
+	unsigned long npages = page_level_size(level) / PAGE_SIZE;
+	unsigned long i;
 	u64 ret;
 
-	tdx_clflush_pfn(pfn);
+	for (i = 0; i < npages; i++)
+		tdx_clflush_pfn(pfn + i);
+
 	ret = seamcall_ret(TDH_MEM_PAGE_AUG, &args);
 
 	*ext_err1 = args.rcx;
-- 
2.53.0.rc1.217.geba53bf80e-goog

