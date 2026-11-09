Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254570;
	b=aHF36w3SRwkh9ny11PbRpWqP4/B+iiS32UBsnrLAAhcE3ksEZ6elbhipYlRJMyKXw7dQ
	 A5XSCZTAOetuA39J2qOTFMluNdXe8pewRXgFkXDp0ZinzU1KufN95LDZ9nfIp3BYk4igo
	 dhNaVTvc/4ZyjDy/F2FaSAKiZjbCYikLewQlRzOCvxwG1veSSX/rg5/NoTEBi5Pplzq5G
	 dHT3H0Drd7a0SWNcSnNqvB53S+4deowEfusdujbPrqCV5I/6MMELKNymCNLSeRda8h8SE
	 vpv08x+VdoV/xN7j51JsVE25DKW8PjbRuUQG6fOjZtgBtjwaKpon7QFcfpvzJ2qJwBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
	b=ijKCUwh1Wv8EmPpG0/7OKQZaTviQOdXjMFeQ0rcjEf7G4ZnARhLSFz/Rb9W19YMnnic0
	 Ix946ogjL+6uN3y//nNM5hPh+yUDn+0tUBHe2NZjG+xF5GPOMoMMgX1kAOuY1iH7ol9/3
	 TRmb7eESYt69R8XGWC4kl55rdrGscQYYrNnYjH2Ov3Zk3h1pI0Nsmq6iqwKpjHUJEcLP4
	 0hc9dRPk7IJVnQn6tkjxTeFcxzQyVITdC8S/fMe820g87XKnaHH8QfIUhBV+ITq821edl
	 6mteZMG37meLSFFfK3xUYOS9xsjkfyFu4sBx1vcpt9YnVbUqzA8iHIg1Phw0tk7jK6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQ2zHvUR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03867606A33E
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 20:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03867606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQ2zHvUR
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eae1276409so513190e0c.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 12:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254569; cv=none;
        d=google.com; s=arc-20260327;
        b=VKNgjDzOBdZdk9eaBbLZ1xWQht2ALuHRIMfDPiIGGTOG26mjtTvt5l0SKuj0bAdumz
         lE+OU+zPveXKvQ9wIBKU06YYaAl2wfxdUXxy8xcSshvd2banF6pXvQXQFJiLIIuZ5pQ1
         RzJMFHcqcXAhjFRYZ6Qi+epTvASkcgMs66/Muu6vBuzKGhrd6GtaI7xuPvE4wRDM79YT
         JbUVk7nRNa9ePLqUdZUGHioJIf+06tcIu0wnmvgheT976RBF8y84/L2LUf/K7MxmR/Ht
         u4e64F2/8cYVTyKBFt83PkzZtiVAhcDHRoRaJwGuiDfCEqv2ZaQTgTxm9vSe846zhz8J
         IsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        fh=ThRJuTIo6sZXMGgRmKk1wt2cQOmyOoYjdHIRBpMWdtI=;
        b=PW/5dwo5i8UIoNY/BSQByCfY+EP4DlenRfWBiAtO1OSiXMg1oxpjeVfKHOlpNu0EHo
         VcuxwKZOGbWyoN+2rGRbG2Vq3patyJ6dwSu2w3FGXBgXYHqLOKvReuM5wl0Smn/9pVjI
         ScZTTlJUFK7lltsRDja6oTX2BR+VsgwM8nr5a9Vs/SOgAnZ9ifUwtM30FDvfgwdr/ke5
         M1S29YlHYUNBZXQvppQObmStBU6t7VBdvyJHNw63UfbT03d3z8Ixhjk3xpDPddz0Gmnm
         gSdaaiESFd7Og6AsUb6B0uVv0oP97U5PV5msegUZSW0RsaCXy+CByQjyjrY0gHAAMsut
         Ctzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254569; x=1794859369; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        b=XQ2zHvURlXDAzrrCKoTK8n5FVLMomxu97R/woX2YH+W99w/pSZuQlj625HPGeAJXsZ
         k/lvJ1fxgomgVR6UyZsFCBfSByXex0ucIyY+gJfq50uv4r9+DOh4GV+gY8fVIEIcSWGP
         mPuyd54xRGV8Dc3Vv8bbNOnOdUiRjVBbx6dzi9JMmzFGqq2884zu/YcoyEk10rVGr5P9
         qK30wv6MCePz1AXlavqyiz5fSr40XYxWPLAl+XH5s6QA+6g/G7Rof9ImObYK3zY02nZk
         A+3Sa7XXXueRqlOzBUMIEOrNSPijpjVq9aPI4BUqtXHPgiDAyG4wxLmZEZBmsSWYkXiV
         Lz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254569; x=1794859369;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGRFFPBB1wF37JYd4Ts1/YLImPhgtURF2AZXR3nqT7s=;
        b=bf9rjzrbHagzhO5eKWy8yP7EpOTyy4oVK23agsE61K7fglluhPAXor02OF0GcvT3JB
         ql8VzCF1LqPcROgvmq0WxiSyUnxPc29lItnCD9MoDIHEXqAELEVfOt9Q0SPj6AwvThAA
         0xr8mcxvljcLeNjQ8YHeIzL1gJmWGplOGz8690pUD45wecc/PlQVnSSs8sa/GTXHcYQe
         KeX9HofdnuMbh/pQ+ThsIteCP4Xv1j/26O39jYY6AzgjKLpA6Ewpp9lq+hpXrTXhEMhU
         his/A2AOB7AXZTUgRC7+/ecQONTayyv19kHull0craQyIqhcqcF1PaOdC0HKFvf8L8B+
         ARiQ==
X-Forwarded-Encrypted: i=1; AL+hErFphcNypultwdrCL1CNWil/0QtRQfjiCHpVQqmXB+t+2mnnn9M/6X9MzO+gBx92i038xvVQuYIw8k9g@lists.linux.dev
X-Gm-Message-State: APuU4Z+5qVB+9BSL4jAZzus8ODZklgRh3uklpZQVJWz8El/n7gDMFrbb
	sWHeR8M31P1eDzD+oFtzcg75DJJYe5kp+kdWkZFzsjae996bRMFT7DylTKpzYgbiiH54O8gx0aD
	Nke2pESzQVMm0MB1q/106DEcNH73U1AzRtJ7KVCW7
X-Gm-Gg: AYBFou2WGWan4Rk6C/i6v4VwKoFVKJNg59YwvWVclHqSdKHKj1PCpidobIx2J+vEInK
	gqrE3LLUAUXOsgI09Uw5qSxerym++qGW/GLbN57xIqCrX6yRehPgiZ2gUh4rL1A4G+OdwtumMS4
	8YVaLuJnI1jLCEXAtmevhtk3jo1D/Y5TXH1XMl2bio4BEpNDZx6dE2Yxga2NxqvqGAOkyeMV4qO
	9qfdR+e9zRis1ZIwllPmgt9CPQMNou9iyfUxn4tvWED0Zc3uUyb6hgfbtMn7OGVFt27sB7slIhU
	1U34WutOXJNgK9R0l5J4HckwVp8KEsqgAqJ9X5jfevHs2pkr46yado/B7NdxXl1mRU3EN8Z07HI
	ly7YyWfETULYekJ8h9LzpVnQwTJgmPS3CT5UnDPvEb18DIRnoU7PswZQlAh1K0kSXZKNxv1WOYe
	vySMt6Of5TzcnCdG+tsi+K1cOmdRqy7laKBQ0Mf0tRJh9d
X-Received: by 2002:a05:6122:218b:b0:5ea:b04a:cefd with SMTP id
 71dfb90a1353d-5ee0d0a58a3mr105598e0c.7.1794254568208; Mon, 09 Nov 2026
 12:02:48 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:02:47 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-16-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:02:47 -0800
X-Gm-Features: AclHuK93pizTTBvqPPHn8tyB102k3E6xp0ArgfRjiMFhvMMSdBvoYQSIxOQgtlQ
Message-ID: <CAEvNRgGQqdrcLcYbSbiXmFRAHwvGW5Ha_2NPWhMNs-qpnWhZCg@mail.gmail.com>
Subject: Re: [PATCH v16 16/20] KVM: selftests: Load private memory and
 finalize TDX VM in kvm_arch_vm_finalize_vcpus()
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Initialize TDX private memory and finalize the TDX VM after VM and VCPU
> creation.
>
> Hook tdx_load_private_memory() and tdx_vm_finalize() into
> kvm_arch_vm_finalize_vcpus() to avoid the need for every TDX selftest to
> manually load initial private memory and finalize the VM. While this
> prevents TDX selftests that use vm_create() helpers from customizing
> memory before it is locked, no current selftests require this.
>
> In TDX, finalization is a mandatory step to make the TD runnable. It
> also finalizes the MRTD of the VM's initial memory and state, locking
> them in for future attestation and preventing any further modifications.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
>  tools/testing/selftests/kvm/lib/x86/processor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 11db6a3b0366..ee8a1715d844 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -1503,6 +1503,14 @@ bool kvm_arch_has_default_irqchip(void)
>  	return true;
>  }
>
> +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
> +{
> +	if (is_tdx_vm(vm)) {
> +		tdx_load_private_memory(vm);
> +		tdx_vm_finalize(vm);
> +	}
> +}
> +
>  void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
>  		 const void *smi_handler, size_t handler_size)
>  {
>
> --
> 2.56.0.455.g6c5a503b38-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
