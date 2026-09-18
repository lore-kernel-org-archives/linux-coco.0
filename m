Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC243A4F4B
	for <linux-coco@lists.linux.dev>; Fri, 18 Sep 2026 01:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695653; cv=none; b=cyUJzCqYtMtx3WTpIjqyQWsmtzb1RM1jEiOOXJ+Q+zZt7pejVQZa7E/Elcf0RW5WW59tNbSB9HdVwTSAIOfQonc3lpewxARJAiFck8VM4jcto56RiiH88ECOrUrIgUWOARYNdKUve8/nxyhQJ7ORg/ZcLNXIW7m6XG/d0TeXFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695653; c=relaxed/simple;
	bh=Eo/yga4vDEGayDHqVP6iJdYvyA2lrJe+j+Dvmd1JbAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZZAFor5ZUf9fT6LYQc77lM1UyQTEeYTD2lwPyD7uzlOQtK3TwyhaC1adiqqnYgzHFYve8EyN6XE8HD194DRMUUOqzK4gTafTPhPb/Jjm2pUAgQX0egOtsWXi81s0GdWkgKCuA1WolOSueKSGrf2Kk15D+6ZQxYzu/2DvW4pA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+uDrSl2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+uDrSl2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8facae850so55385ad.0
        for <linux-coco@lists.linux.dev>; Thu, 17 Sep 2026 18:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789695651; x=1790300451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76px+Ex0r5rs6bbVIuEECvEPc+oBZjVRzvMFC1AHdA8=;
        b=p+uDrSl2CzXxNRCYwKX5Yfdkmcka3yq9UG6cJNTWFoZWkAz7uL6ghqwoZNTNLgd5ir
         ftkMn1hd6keQvPZFVwSZDlrL/C5s/tP13vM/Gli1S8SP82tw4xbeSCzCfwJ0Y0y5a2Go
         GonP3oToPx7Qz+CxVIf7TIkarTp95SnwWswzvXBfZjphn9ibbkw/M4/cRHyHTZZmKD4w
         iVLr41cX3kZBmLsZvHSry1ahGtGM6PHIaMoJcxhBv0H63w4gKUd/ACPTb7PuEfgW9Pf3
         DDn5VQjEXtl0alMl6P4tYEEdm8rMwXGNqzXnseIcLeRdVV5AWYUMWZkKWnlTGKbMg2eL
         Y2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695651; x=1790300451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76px+Ex0r5rs6bbVIuEECvEPc+oBZjVRzvMFC1AHdA8=;
        b=fuWTDzcsos0BkRItbg5EjOkUIcPkRPjbcWtcoQmP0JEr5KdwEycPhY48fEb1P0S2Cx
         0PtLT6370+s3Mlwg2Ag52K1xtyZDUsBQtIcIh+BibSYSbIuqLHXE/3O7vgW8SKS5UTq7
         YwSqe/9JYIhpYfg3xWHKii6rS/YMreF6lhatzBfQLBoMRZQOce1FObCBAxnqMAWFLvXh
         pwKHD2QngD7ZAhuBejwTun0ZsnuLibazHv9RdDL+auUrMxPVPsTgWmu3nahPzS7XvpBP
         JAhJhOYJVUPw/LzUXOypKYUD2RSF8slkA1txJ807aTPEhz2oQnHUghlV150KxEBwRodK
         qZYg==
X-Forwarded-Encrypted: i=1; AKwUvBzzyLF933hDSuqxTj1tzmEfKT3loA3qUSr5eCFxUWubN+i0iTJCxW8YtqOgrZLqOA3irv0Jvg/Hm+b+@lists.linux.dev
X-Gm-Message-State: AFuF++lVm9/6ZR/r/TGCj0ZssgX6O/MU9yvHojpMCFTXYJkg1gIc/xbZ
	7tBZIyFrUEN/Ri/mtwFRNH1UtPHnACHL2FcSnj3WYbNG1QPYpivpel5QZpw5XgC4LQ==
X-Gm-Gg: AYBFou3EWgKuAY+t6oL66a8KLLaTr3QaC6FwPwIu+m5SxSICG8q5mJGhaYjwq9AE1nX
	TnpsMuhnKWVH8QoFa0vldnpbvPmVBjr2A1q3oT6dAEeJTgEh3PG+CL+honNenQFmviL74x7T+tt
	+ZTO8WGIJIYEIoWkRnr8j2Qni9GVTFMnA4Ws3bq/Yu5nnZnykFGq/bsmqySX1U8IbpOXULjdMWG
	6u1pZGVFSri3ZZvkXywQi1Tn80qnEwl/aZ89DUcLk7X9WEYB800No1eo019AW1xxHGe5tINL4zt
	Pav27Qk1LmS/q+8M5E/VzXC+xyXJMYWkASMgyGQ+5bOsTUwnuzUhuxAKZ365ERzjfqsA22Xxz6Z
	13JDX+/UITvcYVF4LdBKAPIx9aCxCi9PZXe8qcKSLjT+ItOreQRk8ZH+ft5d6UDq4q5fYw8XJMG
	PwzzgqVqsShZsrmJpdN4PwKPF0F4UunBf+t/EwNIXmdtpCEJ9XwhB8VBNhNmylmpaajIW/5zJcH
	NdrcV6YUmUOf+gSEdYJR0pTIYVgej+1
X-Received: by 2002:a17:903:4b4c:b0:2dd:3a08:d47b with SMTP id d9443c01a7336-2ddb2bdaca1mr2575225ad.13.1789695649908;
        Thu, 17 Sep 2026 18:40:49 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36116920sm7796342a91.5.2026.09.17.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:40:49 -0700 (PDT)
Date: Fri, 18 Sep 2026 01:40:45 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v14 03/22] KVM: selftests: Initialize the TDX VM
Message-ID: <aqyWnaGBa7Az5sND@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-3-15ad654a50db@google.com>
 <c8b7a800-58ed-4ef7-91bd-31da77763717@intel.com>
 <ap_Bpe7dZm_eWsJ2@google.com>
 <CAEvNRgFHTAPYTVQ8a_PVdFLqQ8z07Uep2XhA9r_Ypw+D0WAC8w@mail.gmail.com>
 <07cf5761-48fe-40b7-9310-b64712f5e314@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07cf5761-48fe-40b7-9310-b64712f5e314@intel.com>

On Wed, Sep 09, 2026 at 06:00:53PM +0800, Xiaoyao Li wrote:
> >> The reason we could not use __TEST_ASSERT_VM_VCPU_IOCTL() directly[2] is
> >> because it formats ther return value as %i (32-bit), whereas
> >> __tdx_vm_ioctl might return a u64 hardware error code.
> >>
> 
> Since we cannot simply use hw_error to replace ret, there will be not 32bit
> vs 64bit issue. But ...
> 
> >> I agree with your suggestion to introduce a new
> >> TEST_ASSERT_TDX_VM_VCPU_IOCTL() macro to print out u64 hardware error
> >> code properly.
> 
> ... if we want to print hw_error as well, we still need a new macro.
> 
> >> [2]: https://lore.kernel.org/all/a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com/
> >>
> > 
> > Is tdx_vm_ioctl() the only place where TEST_ASSERT_TDX_VM_VCPU_IOCTL()
> > is going to be used though? If so, maybe we should defer introducing
> > TEST_ASSERT_TDX_VM_VCPU_IOCTL() till later.
> 
> I think tdx_vcpu_ioctl() will use it as well?

Thanks for replying.

I agree all of the other parts of your comments.

Just wanted to point out one detail: tdx_vm_ioctl() is the only place
that actually needs to evaluate hw_error right now. Unlike the VM-scoped
ioctls in the x86 kernel code, the functions dispatched via
tdx_vcpu_unlocked_ioctl() (such as tdx_vcpu_init or
tdx_vcpu_init_mem_region) do not currently return the TDX SEAMCALL error
codes into the hw_error field.

Thus, I would prefer to inline TEST_ASSERT directly inside tdx_vm_ioctl()
instead of introducing a new TEST_ASSERT_TDX_VM_VCPU_IOCTL() right now.

Lisa

> > I think the issue with if (ret) is just that TEST_ASSERT(!ret) already
> > does that same check, and so we can drop the if (ret) part.
> > 
