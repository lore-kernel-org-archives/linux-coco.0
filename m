Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EC635AC31
	for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 23:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419659; cv=pass; b=ktDsTZEOyhUJWIMyteDkMJaY6MArMO+BpB6DIauBE881Z+B3tKQTwjYDEuENf4UBR5Go39DF/OVuc7hRubeFwxxkCUqJs7sGBkVBiGDlJZY3PKHJzhfncXE7YGm3PfRvMS5H3Dw5LR/te5i0iUcvLcfoywIwHyyQ+eLP2vNxMF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419659; c=relaxed/simple;
	bh=U3ahQduobNenu2MyiCXv14Q8IImIIVCNH9OIRKPH1FY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXN73pzUihUPOWfacmEQ1yFSnM/NoqBRNQMxye6dPs9l+czhPPeAn14cXDY/wBZVc+GNIUPX44eqXAcY1/Mmsb/Y+izIEUb1uCbN4EFyn4XLT+/EopjhshIK/Hpk+IUaYeElNS5SlJmvckVog0QSZbF+2CgrMZKYXT4wWCF+BBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asCT+6j6; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asCT+6j6"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-60fce51aa55so3722801137.3
        for <linux-coco@lists.linux.dev>; Tue, 28 Apr 2026 16:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777419655; cv=none;
        d=google.com; s=arc-20240605;
        b=B9T7pxDYGSr+U5MoNy0W61cM15ybcNRGBnlqancAHDzzPUB0D2O4aIwUVPMMNkB9Aa
         yV6RoqyLUShWbUlJ5gKpz07Z6yfN2la5ri++3owfc9khyQHO5atV8OW18cu792cmJfRb
         zFipV8UtCJ4TpuS5K6k/yWWzJUoaoxxcf3y8+aGophYBJdKWIRBtvx2x1GgGKEuY082M
         W4PVRoiKmRExf5gyHFhL9/2RO/fMxF6/6yyZ58bdQURXt+X33qw978ubvF2y4PGdzJy3
         cPCslXBZ3pFu+wjMqIeyDfr4CDdAMm5LDpHDL/5+B4WkNR9zNXUWiVME8eGceY+m4HyN
         DpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        fh=aqJ5LY5iG0VLH8j/W/EtEaKcEoj0WSHirE+rXCJdLxg=;
        b=bC97AYZ2fofdPCl2I84ZJVz/96pAwfRpdDTsIILZ2NyUL/yMOoLJzYW7poBYGNObuM
         oHSYaBOXWEOcH0DykjS5o8k8kKNkktXu85C85s7xpWCwQFMENhXNYLohZ3plQXxank+i
         BJAARHVxDKaRUj58DKO3kRL0nZrgi4OOCU7AfwXoB4x0GMFb5buLcrtUbijKJdAKhh1y
         9MtHB0KuI7l2LXNDSGZh5JppBXk2AhJTpx8sEUc++kH6xGw3YUNmgDySxBdcMJBvRO1I
         99xoALRjcuypLmsmDUEBnInR4Eb/vhxwkWoFaohNferPveTuPduingrGY3Ft28wllxLg
         rAHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419655; x=1778024455; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        b=asCT+6j6WbQ76YiW5cD373o1UmaWIy/dYDWbHYJdjvTyVDuAqWyQqC1l1vs+bZOPZh
         gHxvYX+nJwWvoss01fDmaGvIpm1ZqxHyef37CA+kJo8vWFpwc+VKLQ/DyJpYYFSPsaR6
         RV1S+uxRUxlF9RIVyQR+1zaMFOB1D48osl3fW2PugUekOGjvfAMDd9T0IvXzHIahnZ9x
         uaC+T0cxNC/3NAXL7DA6pHImqBMJLXFVY3eUQdV25+WKeRmWpJz+sh0XNuZ4wQ6nlW95
         j2uJqWNyLFMzAk8Ao/WWcomhM/PbtQPJELwOcugcauhQ37bKPrRizJONV5WNIt9JHGa6
         J6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419655; x=1778024455;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSQsiZsSkLpyfyftl7NX7sITr7YX8npk81aNrWQuVW0=;
        b=HOpFylQSv1oqRsyPfUlwT0JzMtXoLKab/F9cFGfV0tLpNv6pfswQ7LsYHchwMs6zMq
         UOdyIKfLz5q/MOsgjcEGdOcBqO3srOZOo3QayCIAg0Ebw22mrwELyzKVes5fiMt3M8dU
         J/X4+4EMpmkj+3EbFojsdZJVFKH7xAML/+EQ+MLrx99DydYeymCrQUe1bLgnuTkV6jIK
         HmxpmDmrNfWl9V7XaGeTgXw4TipHMQlRCDO/zAPm98ipNixDThxvWzMUezF98vwjfD4u
         EAKBSNCOF3uoUO0eeVpOGWMkbBgzj2JCqqZxt5BjVG/I+jE1SqlatDC6LZ3RHg+h3vgL
         I6gA==
X-Forwarded-Encrypted: i=1; AFNElJ9lDL/7w/7C6rCi6bzqzHInDLFltYoSgh334FQrAMB+pfCYc+Gsjty9tqutClExwE0npw9MmkI7Nnaa@lists.linux.dev
X-Gm-Message-State: AOJu0YzdbWggtk8i0jtsZC5BD6QIku+66bOcSHAQX+1zwScwalVllFDC
	iFZ/23sa9JB4MjML2VEnVM0FILWu6C+fOV5faBsx5jy1pIYgN8NEcaqWIQqLMT1alpP3I9GUp5l
	fBMlwa9Oruqct51CpIBc9lI4vfcL01mbTfZ3NHqku
X-Gm-Gg: AeBDietX8bNwxoO29RpR02UY5X3LzkRLqkPjMWBQRIaYe7XIRiz7EqqA4tQlA3hynmT
	d8OmRixqfTVPlginucCJ1xwhUapwmyU2FmuQQAORqjdjh7W2YXlmToeuV0JwSvCebIoG6XeBfht
	bERPpLHCXfPQuRHl43yqMIWLCNDNYPwwuJgIj30PiU23dVuBPwfu0EArleU0moWt2euMhs0MdpE
	5DTP9qEOmNaf28KeMtUxHvOns43uevj5Ku1pht9M17JFWkO2PpC3L1pC65MeYfBq6HubArdH7R4
	kZi24xuxHM/J4b6xnhzSl0K42ZYLFgQBvo0gxKipgSDqxQFMj/e0YX0NPUQ5M60EoRYllTRlAi7
	5oOPABF212SvF5Nc=
X-Received: by 2002:a05:6102:809e:b0:606:49d:183f with SMTP id
 ada2fe7eead31-6280b1df187mr2828068137.26.1777419655062; Tue, 28 Apr 2026
 16:40:55 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:40:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 16:40:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260428-gmem-inplace-conversion-v5-24-d8608ccfca22@google.com>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com> <20260428-gmem-inplace-conversion-v5-24-d8608ccfca22@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 16:40:53 -0700
X-Gm-Features: AVHnY4K8zc89tOubY_FIZvJs5RqMpzsyiDSJNy3Ts6m6f6GRhz2hBKqCaZ_7fHQ
Message-ID: <CAEvNRgGv3RZipinpQLCGUfBCAfS0PRc1mCx2yc3JgjfEu=QhdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 24/53] KVM: SEV: Make 'uaddr' parameter optional
 for KVM_SEV_SNP_LAUNCH_UPDATE
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

> From: Michael Roth <michael.roth@amd.com>
>

Thanks Michael!

>
> [...snip...]
>
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index c2126b3c30724..bf10d24907a00 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2343,7 +2343,15 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>  	int level;
>  	int ret;
>
> -	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> +	/*
> +	 * For vm_memory_attributes=1, in-place conversion/population is not
> +	 * supported, so the initial contents necessarily need to come from a
> +	 * separate src address. For vm_memory_attributes=0, this isn't
> +	 * necessarily the case, since the pages may have been populated
> +	 * directly from userspace before calling KVM_SEV_SNP_LAUNCH_UPDATE.
> +	 */

I dropped the #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES from [1] since
vm_memory_attributes is #define-d as false when if
CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not defined.

> +	if (vm_memory_attributes &&
> +	    sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page)
>  		return -EINVAL;
>
>  	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);

[1] https://github.com/AMDESE/linux/commit/7e7c29afdf3763822ced0b7007fc0f93b8fb993d

>
> [...snip...]
>
