Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05749256C8B
	for <linux-coco@lists.linux.dev>; Sat,  4 Jul 2026 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783176153; cv=pass; b=gt/bRHPR/9BhoOvFWUnSj/cZrSqqL+XWUKMidl4z6QvuUsf+I0IChC7hUVhY8ybcZ4XRI/zR48S8q2zC2AxFyBOds3GW1qaKjHhBHxyiCMyYvIwTgeVk8Vcz+F+rz1RW4kYs0FUGYatfvfoWbWqDzpoxvXCo1f4jAP6vdocV61U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783176153; c=relaxed/simple;
	bh=MoaHjkaWH3mVoA4yYUij+2yJ1onRPN8dEfQ18Xxn+3Y=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVDnGC8p1xeujmfL+0oifrzrh93jUS8dQJ5e7Xnw8Ns2BL9TSSPA5jC8hXvnFKgBUSQKrIodcqSvQL/KdSnpytM0DyI7kaH6cljgnp0/+UOySIfGLktW+ibNuqXH0Ju7Sh0Zs0Vm4VKYvAnysSnaFbX0Cha3aSZeglDYbbQm+OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2h+k+Bj; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2h+k+Bj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cae134bdc8so7006915ad.3
        for <linux-coco@lists.linux.dev>; Sat, 04 Jul 2026 07:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783176150; cv=none;
        d=google.com; s=arc-20260327;
        b=fXE6lILFyJa2F9dowf+MKGmg0edpD6opU7lQAYNd/VyrnQbmO+b6lQ5k20Mi952r7r
         hEcxv4jQqk6B1KErQqMLeCRE+xRbgz/kSe1VaExAQtLslHDiiDTR5arlWMhfuCSGlkej
         nJY1mN71biW3kPTJvVnBsSPVuZH1eH7e9iHDPc0yimq6WKvovXBVky4IB/B7W2/84wCN
         QkX/az9GBgJxhsIArT3wDShqvQchaj7jAxBEZNdogBKKOctoFf03YtRmciAjdtafthrG
         obTHezlNlywcADDvnhYZcyqMpLFAE9aCDUeObzgy4R7gTeqtw7KUOM99Iw3b1RorPQk4
         jcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=3hO7xVm3JMi+xvznWIzbCWLHGJef3ve9nJtp5Srpwow=;
        fh=3vlaSbfVHvqooJAD9KANWx1hUmhOI4ur5SVnAalimG4=;
        b=dQdyL211i8EIc3AscA7+nV54MipfPitve0xYSWy4IqVjMJnUhG5JwKCv25MANzs+bK
         wpBMiK+dV4TO46aDf9vIr1dhnYvt5DmoJNFYKJP0oxvSy0OZdwrB+/jR3mH30GrT6Ita
         Is4IQnG1SRtquuz7xJ8x8uGUfkdiYDuhFzMgNxEw9IDYHp4YMFBFdovaswCkad4u5ytn
         z4fIw3a2VwjIMHEa5rd3XIas0aE82Nb0WlMTU/caTGTSb/N+K5H03WAbWjzc7QLdIPs/
         OcgMn9dI08m2vx3vc6LFUbP9iPj2Xetglw7fGSDV+wvjV+so2dXeke04cD2SLjXXn1Aj
         2RLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783176150; x=1783780950; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hO7xVm3JMi+xvznWIzbCWLHGJef3ve9nJtp5Srpwow=;
        b=e2h+k+BjDpQHdTZGAyXimXD6okyRTozL8Hme5+WtKrF11Qw4L3LCBqb7YRnT6sn/Ia
         KtDWZKbMH0UZ9zZ6NpyCUtor1oD7+0HLRufyNezy7o6gT/YMjAwp9L/hDtTa2ITr/xX/
         ROf8QKQt2VTApQYVlJGh7lDhUkYyKHguc81iGxb27gFmwzzMFFpDHNrPNPw4Yi6fKpYO
         gqs/uf8Am4Gx1yL1QVCQorA9TpKDXwbFZolzQFjD8xDgzspqnK4nZD+jUpFmtH/9liUg
         6AADuAxaly2f6sIuguwDrzbCzpNMPmSEoiIt4y8H+NR6dXAVmC9jJc73JipIw5N0jGQN
         9rmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783176150; x=1783780950;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hO7xVm3JMi+xvznWIzbCWLHGJef3ve9nJtp5Srpwow=;
        b=sy4e8tBCkj0IVFisXxi7fgzyY0L2jVHPo2J0OB7gu0z2l5CYKgJlqwFCr2ZIY8hFwr
         ImoJNBgOB9BYrQa/ZShl2kTNfc3EbzuPN+2h1TvV4IRJvYXKM4MsdFh+ujg8GZnhQO4I
         FlIzD+b2Bq+EulYMKNHVbezakmdH4y0LqPDfcVuAusb3vQCHyTu8JhH6YXgXm51RP9vf
         /4l9XxiLt0ruRppxN20/GYXbiP/7CugluA3Ib5egyo68g7yCIXK4D96Y3jionkYoE4zr
         JExXder9LPcubu5J/R+SpvX7sqUl2zRzOkNA6OC7KVu+M3SnyfBnB3GNM5pmAZ6b74zs
         +Qzg==
X-Forwarded-Encrypted: i=1; AHgh+RqCWLQ1jyJDKXSe9V2i2RtBCBBZkmOfbNK0KxX+b0Da3a0k86cAGfEnMOebcqYcU1wBQTWTNP8GI0u3@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0CtXQCpxiWD4n6Xp5AMDZL6ErL8xfF8q2RkS8E27xAouuek60
	S/CLFoupPHp+/hl/sAjPDSMNvzEKQoU1LiGhOA6xoGl2WSQbFmuUczSWgZI+gVIE4URe+nHD0Wt
	Cb+5YUtBs+oT1JIPKO35r9mMsI4CKeJquvmAWwuOC
X-Gm-Gg: AfdE7ckjuK1IEzkciO18CcpputP8Nwup0zfHAclv19u3S6HDSTZsp2Q5X19OPQkjatC
	ImsE50Xb95fkAyBC+ut/foSmaH4GyqvvBlLQO2l+RaEwjcT/fyljQoGEsiEUqrPti0oC8NSw6Zx
	VtggFKHM3/4XEHuBxVVhzKcZBu8/C8IkNbSII04tHGrcgcwLK5Fez3lHUB+9GlrulRqflKSbHUH
	q3Fvy1o0cHtxqZTgb7nL8+Z+2udHwe+LcnMbMOtd9pROEUh/ZU2oY5FbHw/PPTfBg1xhd/YODuQ
	pYNhiHFcUHay62+8E70wdd8JiIbyFPbEuEgwuQk=
X-Received: by 2002:a17:903:b8f:b0:2c9:ed16:8d8d with SMTP id
 d9443c01a7336-2cbb9eededcmr35313175ad.38.1783176149804; Sat, 04 Jul 2026
 07:42:29 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Jul 2026 07:42:28 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 Jul 2026 07:42:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-21-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-21-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 4 Jul 2026 07:42:28 -0700
X-Gm-Features: AVVi8CfswepA6TmyRRV0hFxy-bS0yysLNcHLp77b3888QFULsM5J1mmJGvtogqA
Message-ID: <CAEvNRgGgTkOPWELeg5U3pjjw9NZOBQ5zswWy=MRxOXsUXXuFhQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/31] x86/virt/tdx: Add a helper to loop on TDX_INTERRUPTED_RESUMABLE
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

> Add a helper to handle SEAMCALL return code TDX_INTERRUPTED_RESUMABLE.
>
> SEAMCALL returns TDX_INTERRUPTED_RESUMABLE to avoid stalling host for
> long time. After host has handled the interrupt, it calls the
> interrupted SEAMCALL again and TDX Module continues to execute. TDX
> Module made progress in this case and would eventually finish. An
> infinite loop in host should be safe.
>
> The helper is for SEAMCALL wrappers which output information by using
> seamcall_ret() or seamcall_saved_ret(). The 2 functions overwrite input
> arguments by outputs but much SEAMCALLs expect the same inputs to

Did you mean most instead of much?

> resume.
>
> The helper is not for special cases where the SEAMCALL expects modified
> inputs to resume. The helper is also not for SEAMCALLs with no output,
> do {...} while (r == TDX_INTERRUPTED_RESUMABLE) just works.
>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> ---
>  arch/x86/virt/vmx/tdx/tdx.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index cd0948794b6c..294f36048c03 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -2084,6 +2084,29 @@ static inline u64 tdx_tdr_pa(struct tdx_td *td)
>  	return page_to_phys(td->tdr_page);
>  }
>
> +static u64 __maybe_unused __seamcall_ir_resched(sc_func_t sc_func, u64 fn,
> +						struct tdx_module_args *args)
> +{
> +	struct tdx_module_args _args;
> +	u64 r;
> +
> +	while (1) {
> +		_args = *(args);

Is this copying meant to ensure that every retry has the same input
args? Perhaps a comment should be added so it's obvious that every retry
will have the same input, and outputs from each retry are dropped.

> +		r = sc_retry(sc_func, fn, &_args);
> +		if (r != TDX_INTERRUPTED_RESUMABLE)
> +			break;
> +
> +		cond_resched();
> +	}
> +
> +	*args = _args;
> +
> +	return r;
> +}
> +
> +#define seamcall_ret_ir_resched(fn, args)	\
> +	__seamcall_ir_resched(__seamcall_ret, fn, args)
> +
>  noinstr u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *args)
>  {
>  	args->rcx = td->tdvpr_pa;
> --
> 2.25.1
