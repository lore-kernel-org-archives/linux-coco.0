Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C844D33D6D6
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 01:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649376; cv=none; b=ExxQe9JYZljnVj7gi8589/BUnQmw/9tjzqE6lVX0bkbFMQMHHCvIc5kqGPsfnr6iQuf8ati9j8KHJK2r6Hj9njXc4Ip8bYeqU+DaTpyc97Qgnm312pwxsMDZq9eDEgZ2K1P9VURdO1/DhAoW0iI/vkainOD61S9FtdPxvEwRBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649376; c=relaxed/simple;
	bh=EJA7XKSAHRGSswQQXcHnUMuba3R8D9sqLu/XxynOWLo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VHN4DHJldFn0I4Fqcn1qSvxbTQ25cZ5ENG+gaFCZtK1zg7MEPe1kPov76PM53/g09lvtOVmHTGmK34jr+Tc3MwTlEAwkR7GDtVNdNW+nzGy/RIOHG1VdN8GBYVolaRSVcinZzvJSC9RelKz/MEW3ojUXYEM6/4AmfRW5pxxBKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z4YHsqh2; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z4YHsqh2"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34ea5074935so323277a91.0
        for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 17:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769649374; x=1770254174; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1krQa7Jk7W59zRdRjLWbI+ZDvWi8VJAVMG8mEFH1axA=;
        b=Z4YHsqh2DSyYDjVN+HQYyUBg9arMweiBwGykjytd1S4xXC5AM/MZWL4TmsFHmxcy+b
         M00XaznabVSnO8jERK4YLmE3kJ3POYgeXFVyIW9hmfJGO7xcs+fPAxztFbfFnTDridnM
         02BoZLRihp4Qvf1ttY1FlVHlkRJ65BgilCb5nw2veR6iEABkrCTx08erwftDo8Rel2fT
         0MJ12bxll23wReLqioJIoVzbm0s18tO6wnXPUO3lAKMH4XGEg0XFBnQXj6xNOXP3adQS
         gmQLc0Ie1XLwL+nqQbiO8cKOLBvq9junZiIYJb8PUV8kEWyk8TblPpxscFlnWYH/YulK
         CyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769649374; x=1770254174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1krQa7Jk7W59zRdRjLWbI+ZDvWi8VJAVMG8mEFH1axA=;
        b=mMC+6BwynHr7uVP7EUNXaBEmYpIpCnBTp8RCw9/SlMGis0pwsogr+xOJJII0xFT+9Q
         bayzmEVdLU8Ru8BOVVLRQMfSTd0dyvVG4DYvqVlRKV9+JMdlOLe/vI9dewR7DbQSt9ZM
         lZlz4FUbxXW4EvnrJw958YmYyHY4SxFtUoZkpY8HEygLtxeTKwfINvhT/9mEhXO//13/
         v2i/sHUTJPzR8aDpRtPDjltGfa3UD+u3h2TZUHIK1NM7gXsiSMY77MPULKw/4uR3UUY4
         O5QeNiB0ffmvjtMggd0zfRJRjxXACPaH04yQNF6lxXIQd78P5IJiTW8hTwLTvtAj3Ra7
         S3pg==
X-Forwarded-Encrypted: i=1; AJvYcCXyV1YBoTrySh1tegotqtm9JQXbVBcIvtaxRqAdRczLq6AC2i52CoEL4aclic2qJwqFhMcaAhvgnlNc@lists.linux.dev
X-Gm-Message-State: AOJu0YxspSX4QoLBpzq8MS4Pk5kQ4+Db112qDJ/n6JIxxIZ7ROw4KrSC
	7UxwjogbF+5s8OWuOHU8Vn8ACVl5D7Xk1y1oAm7+TIaIYZC1XlLUF6xZoy6qdE7qu6NINxMUys5
	J+E730w==
X-Received: from pjph21.prod.google.com ([2002:a17:90a:9c15:b0:352:c3aa:9e08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270e:b0:34a:b459:bd10
 with SMTP id 98e67ed59e1d1-353fed7104bmr6156493a91.24.1769649373991; Wed, 28
 Jan 2026 17:16:13 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Jan 2026 17:14:56 -0800
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Message-ID: <20260129011517.3545883-25-seanjc@google.com>
Subject: [RFC PATCH v5 24/45] Documentation/x86: Add documentation for TDX's
 Dynamic PAMT
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

From: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Expand TDX documentation to include information on the Dynamic PAMT
feature.

The new section explains PAMT support in the TDX module and how Dynamic
PAMT affects the kernel memory use.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
[Add feedback, update log]
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Tested-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/arch/x86/tdx.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
index 61670e7df2f7..8d45d31fee29 100644
--- a/Documentation/arch/x86/tdx.rst
+++ b/Documentation/arch/x86/tdx.rst
@@ -99,6 +99,27 @@ initialize::
 
   [..] virt/tdx: module initialization failed ...
 
+Dynamic PAMT
+------------
+
+PAMT is memory that the TDX module needs to keep data about each page
+(think like struct page). It needs to handed to the TDX module for its
+exclusive use. For normal PAMT, this is installed when the TDX module
+is first loaded and comes to about 0.4% of system memory.
+
+Dynamic PAMT is a TDX feature that allows VMM to allocate part of the
+PAMT as needed (the parts for tracking 4KB size pages). The other page
+sizes (1GB and 2MB) are still allocated statically at the time of
+TDX module initialization. This reduces the amount of memory that TDX
+uses while TDs are not in use.
+
+When Dynamic PAMT is in use, dmesg shows it like:
+  [..] virt/tdx: Enable Dynamic PAMT
+  [..] virt/tdx: 10092 KB allocated for PAMT
+  [..] virt/tdx: module initialized
+
+Dynamic PAMT is enabled automatically if supported.
+
 TDX Interaction to Other Kernel Components
 ------------------------------------------
 
-- 
2.53.0.rc1.217.geba53bf80e-goog

