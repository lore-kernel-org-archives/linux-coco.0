Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1181844D688
	for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 17:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571024; cv=pass; b=YW6upSsS6EqTb84eJkDzYCZpK7k+pSlyc7gCR51Oak3YK9tVK7uboNNlPzg+LGLrM//cyyWKTnE4zmGcxuRjUrE1AmrbajXFYesrFPb0/4RfjopisuLzdWEau9GeTE71dttaPr4+5B0E643mlm+1WFI6RvxFIESfkMYPqEaa/Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571024; c=relaxed/simple;
	bh=y2FdPNAP77JnWzC+HDR/v/b8dkvosRIA6fuCTFn5zoo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqccxqqwxS4AP7G3EdlmFr63oVgjvc+3IA1tVclavwBoiQQeFykm5Vz6pWYCfs5F2X490hARrG9/P4RUIN1Fk0bWXPrVLbykpTG+cRCKFYbtUkuk6Ctg3zzJXBiT5KjEp16ezYQYii9lPADR7UockinJ/LD3HPgdICYC6slKfGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kcuYNOtX; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kcuYNOtX"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60fa5eb3ee1so437474137.2
        for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 10:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777571022; cv=none;
        d=google.com; s=arc-20240605;
        b=bRby8asr34zgOMYbkRAYLwqom9TYBUjCWwPQlK1vhPVs+fRe4E4NPDh5HwkEyIClv9
         Uu0XChMNEvDB104rntCQvxyLTCc1YnWnfmPsDcXHVe5Pri3XzslfEAasYdHi5sKV+zg1
         RROcpAtDy1z67mO9K6naCcc4iFb9Ap5OT6Jt4G3jsbudpAJ+2aEj+yYbiCmppvvTWMjF
         S+T3AUJ8/bT+UVbTdhhxegSbRILH1Ck7Y7S14rkBsx54WvVOu4qNSCzEpHgOscP2xTNZ
         nua/NpjUJOc7gKYIjBMNVmDM897tsNAcwHjcgARg/2WJLIeMCaB4szS2IRi2mCswXFe6
         PfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y2FdPNAP77JnWzC+HDR/v/b8dkvosRIA6fuCTFn5zoo=;
        fh=o5A5C4Sbli20D+WrWYaGXuT2Oaci+CCIrJCpXLFu+xs=;
        b=EGy/3cx4Vb2+5kE/F2CbyJspHkJn8cUA/0CTkUXWFeJHrZv14bEEGBCobLpe6kJ8yh
         cZMA7dnuMVk8naXQWHXrwswMF9f18sfjS732278eA/90yvpoNcoxKji62mc7JX1y7vkH
         BcqSDSpJM3QF9fWlJ7KtxbeeOksmX35CjwOa9Xgm/+20u/Nsz/5S2bChXMb9E9hoIuZp
         xZR9xOMqyyZu4rSnwTf+qmTb11ZSaI3qQGgtLd5KTGvFbchxiw1rcUn56oBpUpuwlF5/
         zHG9XvR9Pw5TPkOZVRXhK4VqA+ZjbsbzUDTa7Lo7OUkwtS/kPXP5FRlkSuODzshMqlHq
         BCKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777571022; x=1778175822; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2FdPNAP77JnWzC+HDR/v/b8dkvosRIA6fuCTFn5zoo=;
        b=kcuYNOtXZ63mEt12Xtn2HaNLBboJFi9Sm9uqKVmmsFtw28HHeVBvQhtcgyYxoZThAA
         mnMnVWvP/KtojHymr+tTrBYfXrWCvnH884riF84RIsYzmmws8uy0XwC833Fm6gc88+tT
         k3AhkOsQc1ANI2n6KbCY/SJmVgay8+KGulv4TgyDkpattFdKyCiOELKCP78LWoC1DnrQ
         vQcGZfMKoyffMwyAQ4ZsUf+Uv2et7QAt3KulhXyh5fwrhaM7LiuHSG/4wgFgwnEPIuUF
         ShZA28YmERyjGtyMm3ApOwy8bod6r91ZO2Ci6znSgszxzrU8DsO8gdnnEhL2hpNYmGmL
         /zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571022; x=1778175822;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2FdPNAP77JnWzC+HDR/v/b8dkvosRIA6fuCTFn5zoo=;
        b=Lrsk162Nec7l64UNANyDtkrotwPt3mwEVoo2wgMSVigyWTGFyvcSFDoNfKk33P64tM
         eaYbjEw8elcykCTdYdR5KOWkx/xf4RyiQa9xsIF0SR2OW0BtUuOgqU1Ir+7TGnoB4ehf
         HMSDo5OXGGhXrzx1NXsOtObTNKCNXRPAEtT4tKVL5E8ykZrmNu86J3iGjSf5PyOTHxS9
         ZUZ8WuN5ZD1jgo15xgj/hC06cmvJhA5kd5JWcEnnwSs7isI/GUOpl009XzrFfl0/NdWI
         tCy2b0mjZkYU/8qvB5vSQqLO4TSaasjPfO2Fa5gHH0dmI2Xyd7mNbiLLsS63B9kd2qYm
         zK9w==
X-Forwarded-Encrypted: i=1; AFNElJ+DJUE2FkTPhL8QcDwFzh7iB6x3YKq2QIuxoVqKX+2Tm83HnsLOCRg0Tp7A8BXieBV11mQwphTItlXB@lists.linux.dev
X-Gm-Message-State: AOJu0YxhI3GZxV9pczoT0G+eRsOq72YOFT1gs+3IzWK1V3lJezgFLi62
	0JPsBSvSLFfoYyq3it0DHWeY7M/Nr5IZsQUqLn9TIaYZNkNjcnaoNpx4gBDze4Y0srGqKNH2pzR
	hqpFGsghBXQiM9HoyC93fD9ifNIuv4UARb7bB2vjW
X-Gm-Gg: AeBDietFtek2op25SLOiG9HXSESAxxyn6t3t2oOUFsDc8v8sieLlDGJR1GKAgC9wWRV
	NAFIv6jcIHWa6GC9hbfHc0IxMGJ9XxTA/5gk8pO7XQTrOno0Rioyi7z71W7B8A6tlqU7C8UkwBj
	Btr8YtXrq1nLKEwh4hPAMcB5g8COPQBy7UZR4YicknwE1aAYfAP11lBWrKWJEXZu1R+KGGHCz59
	hGvxy2FeqPEoYQZRmlz7NfETafv0pZaJ6JcpgvYcXm68rQgrMXszae3qz4IpLqpu9sMr3X8rXjK
	TcL6jTVmyMhWuZ2QP/vK8lPOzxBhJ/j0ZtAZ/PDkOT7dmOTCpq9B8LaCoNOkAnxi9NP6D+v9DwB
	KBF4/buQ+Z7d4jMU=
X-Received: by 2002:a05:6102:4b11:b0:604:e063:4fa8 with SMTP id
 ada2fe7eead31-62ad4da0ed6mr1942860137.26.1777571021515; Thu, 30 Apr 2026
 10:43:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 10:43:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 10:43:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260430014929.24210-1-yan.y.zhao@intel.com>
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430014929.24210-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Apr 2026 10:43:40 -0700
X-Gm-Features: AVHnY4J5rn5Jaagn74pUA-cynNYnmPoCwD9s7pVEVIJhT3yHhX_wIsfsGry3Jz0
Message-ID: <CAEvNRgEBSCN3NNgABy48KXTdsKTfVFvafhgjKSC94YMjwqMUbw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] x86/tdx: Use PFN directly for mapping guest
 private memory
To: Yan Zhao <yan.y.zhao@intel.com>, dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	seanjc@google.com
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Remove struct page assumptions/constraints in the SEAMCALL wrapper APIs for
> mapping guest private memory and have them take PFN directly.
>

Thanks for this :)

> Having core TDX make assumptions that guest private memory must be backed
> by struct page (and/or folio) will create subtle dependencies on how
> KVM/guest_memfd allocates/manages memory (e.g., whether it uses memory
> allocated from core MM, if the memory is refcounted, or if the folio is
> split) that are easily avoided. [1].
>
> KVM's MMUs work with PFNs. This is very much an intentional design choice.
> It ensures that the KVM MMUs remain flexible and are not too tied to the
> regular CPU MMUs and the kernel code around them. Using 'struct page' for
> TDX guest memory is not a good fit anywhere near the KVM MMU code [2].
>
> Use "kvm_pfn_t pfn" for type safety. Using this KVM type is appropriate
> since APIs tdh_mem_page_add() and tdh_mem_page_aug() are exported to KVM
> only.
>
> [ Yan: Replace "u64 pfn" with "kvm_pfn_t pfn" ]
>

Thanks for your help, Yan!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> Link: https://lore.kernel.org/all/aWgyhmTJphGQqO0Y@google.com [1]
> Link: https://lore.kernel.org/all/ac7V0g2q2hN3dU5u@google.com [2]
>
> [...snip...]
>
