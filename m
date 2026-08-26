Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84EA38837B
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738593; cv=none; b=bi/QvcTFiTqiwMRv8D5ZhmbwRIyy0fdlKvJffBPzTwmSgsQDyR3jgaT/t2G0yPp6RTzc/ViRNqLBYNFWJOUOnFcQsWJQSnfIwbM3x3kaHSd45Nvh+0GFjTG0sjLt39VcAqR7VKKAjyrgTyfHKFgY/kLtwFZKDsJd+9P4h5ke8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738593; c=relaxed/simple;
	bh=AlfYlEb6WKoIrIEWU9ApASMS98YxtvLdbBvocivgdhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5jsUNyMDIWbnBigjQzAjtZcSY3BzhqUql2tVV4xcxdDe2VjPQ6VxlGxIQi0Jksx3s42rgB1XZNyxfly2vIlfV/tQNop8YSt9jsTsZan7Zbbm7FIt4e+pHrIxW8J8CG4YogT5mmvWrcSxpphqOrtty4YajHKOatdCG7t267ukSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IpDbRxNK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IpDbRxNK"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so889924a12.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 03:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787738590; x=1788343390; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bE7U1SVs1nWjk547BlCoF5e3zoAI9ns9idl/rgWUbu4=;
        b=IpDbRxNKvVNXTHrgOOXnEGAl0q7OQyDYvUMIHUpl9amuQYT9mb28AaCnyc1rDwKumQ
         +ZtsH+Fs0EmkWKcEgjTh8R5Yo1FdFfAoeAOMAtMFDggEZInTQSbTu7RqFYOSgJ3j4nXZ
         5NkS2EzpDgGjOEMJlfytMd7ClA3UiSN3zZPsIVq0s2tGmY+MuMD8wqDozFfsyG4OX4Pt
         d9ZAcFqpwENqrXeUz8xrDfe7+gvR/7ZqpOyuOzA83xnOC0fQN3aYtyy5Ghn0qlGla/hO
         /EHJ7WarlmkMMzsLMFn8PGjrGLczwE0FMIsLuhiXAWOoISZjjsVbnRtbFNXzkY9sqLQ4
         YjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738590; x=1788343390;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bE7U1SVs1nWjk547BlCoF5e3zoAI9ns9idl/rgWUbu4=;
        b=Sf1QJGyitqQNFmEze017oDxledan7JbZ32QkPC691qnJPbdwZnNSsOtyKtqFAcd1FM
         5S1fX5QtWyygOS3V13HP4IH4yBuGG8HWy5ZlLj7N7aycrTidoaCAcXBBDeeJNGirhEoE
         bICA12k7ATSPhbd4NkX3UnqpZ3yczeeUOSnsTJkWFt6vTfavhDwqCaqw+s3OIUlcPAX4
         lvRhfiqsgVflpZTP2qvByiTjLOzyfESAuAlCEn0vooapZXvD5JFP4SFHG5NFHNffusX+
         E6BccL3a7xhXloI3E6j6xDF15acpWe6pr81RkhCLcLQcMOD36vuoZSc/TkBoVQCrdncJ
         aH1Q==
X-Forwarded-Encrypted: i=1; AHgh+RriEc9NaxH+mU5khHarkySOkGFXvYQUHBVW8/QSJyxLcFLyEI151M9eleBdsaFcafncQpT4LZ/KbUVp@lists.linux.dev
X-Gm-Message-State: AFuF++ln5gb5YL8DVjscW8MU6TQDwUYkvjZq/SzQCuGYEHj6IgopuFKR
	ebWy1qJqfCpGUxeR/e6PuCPhoHiF6I9/wcAZ0AaqrYQASChWrtBftfb4K07Np/RZ8uk=
X-Gm-Gg: AR+sD13MKjahz0BQeqwaKzO9OiSErlqOkDsczIOY/j/E7mBSv6tR0LWhXmLVYhkG+jY
	icRh74Rg3kwt7qd+S3VhuWktvG4uEtErLst0jWRWYJT2kAvmh80m0fTXNYMaEWTuyY41NL3Jxfw
	73m01lgTGwpKvpOxkrcR/cE4BmpduDWjYAEGG+qe2jv4m+EkeQobAkuadreztQaZpgEWxniUo56
	M8TFYKBu/pMOl4S+oS5am2fkQWS8lTSqz0pQoZJkZkG2FG6vrMzXOCn56QxWRYmQ718dy1uzqS6
	pNc+WAa33f2G2+z7vCJpg6sPaH2xLd5CXOoiXlqiTu6Y+DZMy3GjKFIiVAhVJ8YADgTGR7tgzuD
	TPQS8fqk8FDa6dGHP4nMt2nNuatQFQJVnYTK0DPrEBlrV02xn+2Dp8yBsY5+RP+6oXTQ2hmbzX8
	kwDQ4+fgkEigNbUZ1HMHBdAMtzOpJR8lXhi5tfCIIO5IpZFXW9AY/yXQpkxETJMuA=
X-Received: by 2002:a05:6402:5288:b0:6a1:f95b:8ced with SMTP id 4fb4d7f45d1cf-6a5df5fd41dmr8268122a12.4.1787738589521;
        Wed, 26 Aug 2026 03:03:09 -0700 (PDT)
Received: from [10.20.4.146] ([149.62.207.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de5f7bb8sm3723194a12.0.2026.08.26.03.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:03:07 -0700 (PDT)
Message-ID: <5426d2f6-3e67-45d3-85d6-d0da67edb486@suse.com>
Date: Wed, 26 Aug 2026 13:03:01 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] KVM: VMX: Consolidate the exit handler for VMX and
 TDX
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-10-xiaoyao.li@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20260819094903.3060020-10-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/26 12:49, Xiaoyao Li wrote:
> The exit handlers for VMX and TDX have the similar pattern. Consolidate
> them into a single vt_handle_exit() helper.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Changes in v4:
> - new patch.
> ---
>   arch/x86/kvm/vmx/main.c | 38 ++++++++++++++++++++++++++++----------
>   arch/x86/kvm/vmx/tdx.c  | 18 +-----------------
>   arch/x86/kvm/vmx/vmx.c  | 21 +--------------------
>   3 files changed, 30 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
> index 6a813c49ca8a..10df9667d0c0 100644
> --- a/arch/x86/kvm/vmx/main.c
> +++ b/arch/x86/kvm/vmx/main.c
> @@ -154,15 +154,6 @@ static fastpath_t vt_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
>   	return vmx_vcpu_run(vcpu, run_flags);
>   }
>   
> -static int vt_handle_exit(struct kvm_vcpu *vcpu,
> -			  enum exit_fastpath_completion fastpath)
> -{
> -	if (is_td_vcpu(vcpu))
> -		return tdx_handle_exit(vcpu, fastpath);
> -
> -	return vmx_handle_exit(vcpu, fastpath);
> -}
> -
>   static bool vt_unhandleable_emulation_required(struct kvm_vcpu *vcpu)
>   {
>   	if (is_td_vcpu(vcpu)) {
> @@ -887,6 +878,33 @@ int vt_handle_bus_lock_vmexit(struct kvm_vcpu *vcpu)
>   	return 1;
>   }
>   
> +static int vt_handle_exit(struct kvm_vcpu *vcpu,
> +			  enum exit_fastpath_completion fastpath)
> +{
> +	int ret;
> +
> +#ifdef CONFIG_KVM_INTEL_TDX
> +	if (is_td_vcpu(vcpu))
> +		ret = tdx_handle_exit(vcpu, fastpath);
> +	else
> +#endif
> +		ret = vmx_handle_exit(vcpu, fastpath);
> +
> +	/*
> +	 * Exit to user space when bus lock detected to inform that there is
> +	 * a bus lock in guest.
> +	 */
> +	if (vmx_get_exit_reason(vcpu).bus_lock_detected) {
> +		if (ret > 0) {
> +			vcpu->run->exit_reason = KVM_EXIT_X86_BUS_LOCK;
> +			ret = 0;
> +		}
> +
> +		vcpu->run->flags |= KVM_RUN_X86_BUS_LOCK;
> +	}
> +	return ret;
> +}
> +
>   #define VMX_REQUIRED_APICV_INHIBITS				\
>   	(BIT(APICV_INHIBIT_REASON_DISABLED) |			\
>   	 BIT(APICV_INHIBIT_REASON_ABSENT) |			\
> @@ -960,7 +978,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
>   
>   	.vcpu_needs_initialization = vt_op_tdx_only(vcpu_needs_initialization),
>   	.vcpu_run = vt_op(vcpu_run),
> -	.handle_exit = vt_op(handle_exit),
> +	.handle_exit = vt_handle_exit,

nit: Why isn't this vt_op() for the sake of consistency and introduce 
needless churn ?

<snip>
