Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C825273D8D
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 00:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777597059; cv=pass; b=UOV5T1lhcxAFLaeUscgSHRwFK04hx2K8YAT9OrjFsDq1INP1XM/1xeLxfA+aQweUCOgwIQtPh2G52rPw+uvyejrWA+o4I7yGmNr5ogpYC1G0UkUMxCipk/a65BPbmGC/MyclV4ePyfVRNeF0v4/5kcOBophSfq0JRxMAZ+59xKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777597059; c=relaxed/simple;
	bh=U7TIlh4v45LfHvUMBiZ4xTOwozbo6CfXpITXUWZhWdA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvwJ96vFeQX7ddsqfOyAvCyk1u2rr08rpPssfZdPn6JDoD68nfDuP6lNjuvWxHU15DfUGyrAbC4SDpSPZUUXfvVD2TmIDVbWYK5tkZeinG9kBjpjEf+/6FPNVpMRUYSI2XokJVxOFoNhtrQG5dWIWxjzRJ2vU4eS/dppTUSb2Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dcY2VTln; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dcY2VTln"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso1380996e0c.0
        for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 17:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777597057; cv=none;
        d=google.com; s=arc-20240605;
        b=l0Oz6//jrRr2eZqduKqZey/GlgIx0Ao9+Pu3XYzW6WNOQ/MWlsrcOkgQEzetwlT3oh
         4jh1e9QV/tdRODwkdTBYD/Bh/kP2SVlFZzFGmxMQ7ysh/bNFLFoAGgl+MDd6cz3FyHES
         WLPnBUfRAwxV++Cjoc0tCrM1dSmEEFHd1DRlPZmuHQkM5lrUTnbtbmD/SRJQOh6irR3Y
         pyxPsCfF1m1bwP1nxBZnh3zuAKB3ppOKZ6qpt915LNH1IL88vPceriOwuNxkSP0OTiWU
         b1V6kOwzqKYOMkFFgOUmy+DHgMGAbt1Edzo9tT4dSU+HrXui9X4D2AKUOH4CmQnJg0V3
         AeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=U7eNz9WL09hkR0ycAAXPIFf/gQ4fMVR3GHfYw3r1ZAU=;
        fh=FBEgaQ6y2nXn7LqrMjwGfQ5Grhv1wxeum5k7LcJbsaM=;
        b=et028hGgSj7XjEQrk4zQlwhRJuZRaCUSQqyNwc07czpPICKQB9iBbV7IFPx88ByVjN
         EDui/X54YLpvwLySiWaMY9prnCwh+XUu4VH/XsRk/PFlWKdSGBuLR2iOQ+KZmZp5HJuE
         BWqih4vt4oNpOgkmnC/KGMiyKdLqUUw6Sjf92AAvYyu/XGJpOXIir7QipCJTWuM27yGx
         DCxPa/90gqQhKQqzayfGWiOgDMVpfmrXQ9RmHhde8kjQ0Oa4xJs+w5uquUKOqxELDm+r
         3qmSLKaAE+eqTvnOkHTEj6myG7UtGaxFvjAQIWJLWg06X8vH8eCnh8IpD6qMnZc7LT1e
         J4vA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777597057; x=1778201857; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7eNz9WL09hkR0ycAAXPIFf/gQ4fMVR3GHfYw3r1ZAU=;
        b=dcY2VTlnb/9DUmJi7tcVQsMzLL0i9A58C1kkYTjBvcLO8H763V0TS+7txBVwjk44yE
         IYk3+tfP6DRN6/Ut/iSBtLVWEIOPM8zG/o9S0XCm+iOqpUTO9xzv0e6g0xuyMl11Hofm
         HjczRCOTlxqPscMAyvUO4OJLUvecAb2Ko9G2c+DZoCeG1zteMXihB8TZyb6JzwXXVTzd
         aoGKxOOKwje3hU6CuPm3i9HBHfNHsCeHt9xAjkVhiW//7EEEO2uUWYdKKtZk1LiJbvTR
         irVz0TzywqzmAkF/m//o/y07WWCcV2K2key1nFGoH6RxyOdQyQSKpvIYZIm90ckyaO35
         Ro2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777597057; x=1778201857;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7eNz9WL09hkR0ycAAXPIFf/gQ4fMVR3GHfYw3r1ZAU=;
        b=RcpkWey07mZnC+VRsGX1o17SPpaJxdaZv8ceDjRjYhiPBBd3fmSO0yvew5t3A5jHeQ
         0QWYBGsPh47SPhvHHexp3MjSpCMJBio0ixI95+bdUk84w8AoH6nj/SgjbIAfRuu/pu6l
         0JMt5nC01P8Ep5pUsR98FHXbhx8jRlLaW3EJEmxiq2rv7OsrFYUc9x+UpP1S6z77KEh1
         7IjzZaMBjkdxBStqLfQL27PLAMLog5K1CaFk/S7Svc0Gt2KuhF5AjVqJttkAROKhKB+X
         Pgcy6iKbisP1RiqlRN+EYDChbso3wG+hfFTUdfTzDiXRTJC/RXwqesWLIJoGtd45QtlA
         wcBw==
X-Forwarded-Encrypted: i=1; AFNElJ+p3KIKPGyvmzfn/4TkuXHW+AMlyYGpRoNc2GQKhBeq8UH9uy2Gh4Getkp7ZJ0hYjMy5EfEsQ8th2aT@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk5nIt1fdNyLQ9I9Exadzvr1so3LcUubkroQgxzoNJC8QPflmm
	61RZZ03DIspM2GcvMTfWDCvXJc1wBWdiEDOEf9eyy8ChqauHx1Y8YJaYL2Fj5D/dMkvN0KgK2fZ
	DDvBCkx+O0yRbyZ1HLItMiVtvrW4TOkc7EY6LkmMt
X-Gm-Gg: AeBDieuXCsNV5kaA0wKkbA8J7X0dxQmb4x987ZUdo6eOTjOtUeu/11MoJGb0BQKq1jA
	SnahEXa8ObgjYUOeyQODorbd/IODOA0LStqzEdNtTbYZv+ikCZ80H5Znz1IrCWLhoWzHLLqkKgS
	KKg2xF3PQuHs0Fpj5ozd3vAE9rrjojEeglC6FaiK7DX2gnVPGx0+1JYMLfGqVpTfPTwSsXaRUz5
	vi5QtQbAdMMxlNLsubAZwQCS7yuHsdC/WCjDO3pd2xfOgCD6Fg8eFMlvf6g8EMpdE3kO0rGT7cv
	n7jx9eZ1lDXVewkLhc4YF7e01U89dV3uY3ot/3KE3szYTyv5GzhJqi+iBzey
X-Received: by 2002:a05:6122:1693:b0:56d:b337:4709 with SMTP id
 71dfb90a1353d-573c95b96famr2946377e0c.6.1777597057123; Thu, 30 Apr 2026
 17:57:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 17:57:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 17:57:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <3067bbb0-b528-41ae-8739-c49432f9a62c@intel.com>
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430014948.24226-1-yan.y.zhao@intel.com>
 <CAEvNRgGsMaioFvTWaLhnDiLbdx3tunZpo3Qzxdm1xeb4ef0J9Q@mail.gmail.com>
 <231efd4e9267d3dbb8c63e57b3a43567c965e24a.camel@intel.com>
 <afOrd7JYkUfe7wcZ@google.com> <3067bbb0-b528-41ae-8739-c49432f9a62c@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Apr 2026 17:57:36 -0700
X-Gm-Features: AVHnY4LW9KIir5isbPp484TZGogrMEiH3gVWwgmOybwgr_YSN1M3UJQpmjObiEo
Message-ID: <CAEvNRgF6qZR17d35+Pm-Kv64T4s4_Xm8QXkXcLMTakekS1nZ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] x86/tdx: Use PFN directly for unmapping guest
 private memory
To: Dave Hansen <dave.hansen@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Sagi Shahar <sagis@google.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"kas@kernel.org" <kas@kernel.org>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kai Huang <kai.huang@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

Dave Hansen <dave.hansen@intel.com> writes:

> On 4/30/26 12:20, Sean Christopherson wrote:
>>> Yea, this is used to construct u64 inputs for seamcall args. So I think it
>>> should keep returning u64s.
>> +1.  IMO, we should treat the TDX-Module as an extension of hardware and pass in
>> u64s where the spec says it takes a 64-bit value.
>
> +2
>
> In this very specific case 'phys_addr_t' is 100% the *WRONG* type for
> mk_keyed_paddr(). Why? Because the thing being returned is *NOT* *A*
> *PHYSICAL* *ADDRESS*. It's a composite type that contains a special
> physical address plus some metadata in a special "hardware" format. It's
> as much of a 'phys_addr_t' as a PTE is a 'phys_addr_t'. Yeah, they
> contain and are constructed partly from physical addresses, but they are
> not physical addresses themselves.
>

Got it, thanks!

> At the same time, if the kernel has a type-safe way of representing
> something that's also a 64-bit value, we should use it. Just because the
> TDX spec takes a 64-bit virtual address doesn't mean we should use a u64
> and not a "struct foo *".
>
> Let's please just not go back to a sea of u64's everywhere. Use common
> sense. Use the kernel's type system where appropriate, but don't
> over-apply it.
>
> IOW, I agree with Sean. But please don't take Sean's advise too far here.
