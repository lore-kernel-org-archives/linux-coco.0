Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA57033A032
	for <linux-coco@lists.linux.dev>; Thu,  7 May 2026 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179577; cv=none; b=CDiW1WIvuRnKJW/vVcLvxgpQMWBzePnO+GUe3I/ZQm+ZtXQ0H2GopMCici9T6fTJV8Er5m5J1EBmgUR5qdFmvSXLmqHysd63b3f0yhpNokAAgzRanqv88FXICBRAWzsKuEk14tUN/ZbC2FKREwbu8BvfCwI91xmR74gBhIyLanQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179577; c=relaxed/simple;
	bh=tWU0AQQMpeAf2oQa8xqfr6R4fb+4+/rnKSZ4VI6XYJk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AlmXdhTscZfOZRon3cPEqnpBCSSTzoi+/jkcYr5/uvbrhX7+RqXHhYQn5Gg7BNS7fbecgDqlkgPdIRc1yE7vgzHwVs80yT3MbMdbaHFeddaclYiPa8QJZroR8X62a+ARNa/DGxhl6xJh5FcwKfgUtw4q2+zD/wTz713ZqDGCKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S7JjPqR6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S7JjPqR6"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b461b36990so14079805ad.3
        for <linux-coco@lists.linux.dev>; Thu, 07 May 2026 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778179575; x=1778784375; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BMFp9ZNQd97vO473dmPCsB2qO20odiBdL6bA91p25I=;
        b=S7JjPqR6wXFgiLZFaaT+rFOF2sO42J+zAMKxhggzUB+QcsWU+7W0xhAin15+fIFq+f
         ja5Z1R9KKId9AhyOcGIuCMayaj4gQQbiiCmqH6ejkitW2+vks58pQckX4f+3i/Q8zELm
         TwYFbcUFxi73v2Mc5S5sAfaC6+leyUo6k/jOhnbWFKeWwfIx79novacPTZt0+30OCwIm
         P+geP3KutmwGXRQPA7izuhSRXnvnCmHND9BYuR9rYjalF/a3IfsD+9zPmxJUO/eGBJ46
         Es80uVvEkYTziYGjPDtE69W84aQur+AqwB2mL2A7NKvNpsjtnzasRwvxhqowihbHIvC7
         M5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179575; x=1778784375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BMFp9ZNQd97vO473dmPCsB2qO20odiBdL6bA91p25I=;
        b=j1JoZwZN/SWAV8lCGabQ50Ow3R4a0/XNJ5BsUmrTrALZWmbSl+HKjDQaqokHcusag+
         XPRiBX1kyXf96AT3OAoYUECUTrgsLESgyrwfL5atWXqAsKGuONFY4fAQC7l1LCIs709h
         giWT1W4lUCpPygRw0OVq7JPVsUUcjymEbEjHZ0nxzqA3g4syViNfTLo9e3dFFHRuNDEq
         uNkfyr2X0xK8TTKTG7OD4N7MPdRoamS4ZsfyYqBtBaMsgjjWU905yEWqk1i4ScSfkVAD
         z5Gp9NYWf8UlMhmtLLLHZp30KGDZc8lPEk8IIiDXzkWE83A2L+Hk5b+DF6M3d15x7fx9
         AydA==
X-Forwarded-Encrypted: i=1; AFNElJ8nOYkh19Pr/vAvL+BPVQhzU/caovoJn3fsOoA3U4pCiuFqlsAsh6+Mu9FGb1lkhr6uHhTNRd/ngLht@lists.linux.dev
X-Gm-Message-State: AOJu0YwmJ3w1cWMaKeMs/f6CVF42eKOy7QaqXdysRyFAQCOTWVpQZWuO
	kAgVT5jTpdxtmUaiMEABe3acIXJ5zvedD7Tc7G1vCHieNEB2CU5PT89SG6uJZXbJ/DM0Xi80Ad0
	ZGQZDOw==
X-Received: from plsb4.prod.google.com ([2002:a17:902:b604:b0:2b4:62f1:955b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2684:b0:2b4:5c20:ec7
 with SMTP id d9443c01a7336-2ba7a379c9fmr62432345ad.41.1778179574650; Thu, 07
 May 2026 11:46:14 -0700 (PDT)
Date: Thu, 7 May 2026 11:46:14 -0700
In-Reply-To: <afxIc/0qNvwcr4VQ@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430014929.24210-1-yan.y.zhao@intel.com>
 <28c8d380-d2e5-4f70-96b0-00225e0ea86d@intel.com> <afxIc/0qNvwcr4VQ@yzhao56-desk.sh.intel.com>
Message-ID: <afzd9vW5fwj09wdX@google.com>
Subject: Re: [PATCH v2 1/4] x86/tdx: Use PFN directly for mapping guest
 private memory
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, ackerleytng@google.com, 
	sagis@google.com, binbin.wu@linux.intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, May 07, 2026, Yan Zhao wrote:
> On Thu, May 07, 2026 at 03:49:09PM +0800, Xiaoyao Li wrote:
> > On 4/30/2026 9:49 AM, Yan Zhao wrote:
> > There is on-going attempt to remove the direct map for guest_memfd. The good
> > news is TDX is excluded. [1]
> We can see if any code refinement is necessary if TDX is included in the future.

Yeah, I wouldn't worry too much about that effort.  The onus will firmly be on
that series to do the right thing for TDX (and any other unique code).
