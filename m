Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254388;
	b=RPYYe6irFIMihHjDTlgIP/Y8yLnZHm7bL7W2+xm1vwc7KoZrr0VHN616o0ygI/scty8F
	 jEnAAZtFKcRUpSD4ubfBJZ/EyVFn+7xy1dxJ+DBv+mko2ALV5MrH0IIiXJj1VonDnZNDf
	 lDCFHbSF+4MNrCga83Qe62EgnlmrKiobFIIuSxV8/49qkZ+D0nGxdc9HgankrBLMFOZ4b
	 eCZP12G2NtsKXV/LQjSKBq2UNa/GHfOGndrpvGq78BemdPfhSU/ZC236IFtgjJp88VdSA
	 1m2e1LWMC8O/kXT1vAu5YqvilzdFn26JyUiWHKl2Nv4KIifzfDI/DWCzMchM339UgYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
	b=oF31S7njmGiK/lclwi3S9LDZT+KMTX7ZsgFaOc0kgUG3QhHI9Jg/jfz3dOqHX177ot8s
	 lOP1zZcazp57/xo45Yso5aRnEu6Q4HrDj/TRj4cqojR52Wu8pebOpm27iWErMwhRSZhe7
	 8cP+LI8gnJMAJyMXWPNHhqGdNUK3O6sM1aCVF8GtjfE6EOXaQkNuuXFuqFAv3qru6A+jh
	 lUk6LQ4wO8WF13qN3DDcFV+RlkH0u0ne0bwPSHApSA8XmQQ8Pq4RWSPlxmLANSeuvxDNy
	 HuwFgIHjdTKiAsJhe766oqgkK/AyXGGbIzdq/OiCaz86M3sS/1ub9LlLoKd183fueQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lY5yF3kG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075C606A326
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 19:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0075C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lY5yF3kG
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c1f548f87so17196296d6.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 11:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254387; cv=none;
        d=google.com; s=arc-20260327;
        b=OYapTSsd+/b3ut0lV1L9OOq6Svu8kef7limYeq9h1I3ts9m+bZbyONnOpICh4DDhVW
         YXeUHz2TJWYoI0fExnVlfUXLjn0QagBD3McQuysftK5hJJr6fV5CCPdcUXdSzWxWOmHK
         FGruc0m2Pt41B2JP3rVx3BIuLPhsNapr7YmKGClnuxjb+h6ei70wQF/rAIOrFxa2UnvY
         fIKvTloJRLEeuIXWqZaNAIHB+mdy87xulzG9I+YR03wVOvvAtLRkz7uimNoi2uYBuEfY
         4MforeFxDTnmGTPt4byUVJx6HuML1Yc/jeia3d5DicAY6zi+z1JAb9oUFM6cZgztywnI
         +Hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        fh=nx9k+n66kWVW7zbiZy60V9681RJbd81tFRfESCELSfE=;
        b=BcoVY10vmP7NuuXUEndI1Qo1FoeR0LiP+RowfgCSyMWC/saQnIlM9lskpp/rK8kJsN
         ypaghp1a9eIGyqrltwTatACri2dCJxjNtKTTyR7KKmZKHkXxyKREGkl5EtoWrIrLev/L
         i3czNKNwMHnA/Q/eB14DwiyYgwDZL4lceQUH+ebByfRPHtbR/70DzJBZg4lVpim/Fjex
         JQXeHVqG7w5/vMHlUI51tfDCN4j/dHxWk3zMtBNHqn4PpyxCcrumMWHjCmNxPRbIMxDI
         tiYOYbk7xvW4mOUeyszZEmVhGS65n4EAOJJeYJwJkh1kN8lj0yjhXTFumlbUsa2k8WY0
         NuGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254387; x=1794859187; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        b=lY5yF3kGOof+83/GGRX/OTZ6zYbUOCF6rvIxAN6bDmBE1E9YVRs3MIpBOlGwju3tN4
         FEQXKHoBQquTPMuN33346GoXo7zBIhtj5RS2PiHnYw4UswHfiL3F0i57QOV0aMZVM/Fj
         HJMUolLtaPQGXXYPbILN+r/AGfXYqcwPZPocjNGboE2Kat5XlVGoqdS/pWcd0+MdwFIX
         7XrE4pQLgp3xWPj8aooGF257xF2Fn5xvV/FUnC8pFOhf9J1yhON/UozoMChCKSXIJ86J
         C4hcMogwl08A9bGsY/njz+g/+SVlf8m6e4GvC2Uc2Okp2jLgmT9B+YvDk3Ct8bHR7s5s
         BAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254387; x=1794859187;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOt00kDVnIg1petIk2pRYb9G+8rJXwscwCWERTsP31U=;
        b=cVObtqOE1KIjiiseupRTJP1zEKUgVjH7s3gwim9W1gRgdKmQBwhDfmUf8+fZ87VEEB
         I9W5yKeYNXaCey9zHOBLji/1LhCCQgYQWDViiFAVFdu/m1NuyZQdjzPEBwJd4pb53AqC
         MiJdRmSR2Zf+wEaOPB0pH5N+Xi5mpAmg9DsiDM2dXv2vl7EL/928QSidtx1vOA+v2FEA
         4n3CNYO3hq4XejCcaWjiv3DI6mQGIzjvOdOxaOKZlsiMJ/wBUj7atVvc3+FCE4k4WzL4
         AsGy5QiiNzk2w9y5qgtnMQi/qVA+qDIuTdPWBFZbj2Qsw50gOpJTUr5HkRQAlQ/QQtTq
         qCug==
X-Forwarded-Encrypted: i=1; AL+hErH+Dg342R2lC9srqoHLWpLAYDnQudx/XktjWLSn4Ht62CnL30Cxf4kakBoLgPW/2OdSV5I8d2AqSxtw@lists.linux.dev
X-Gm-Message-State: APuU4Z9x3T8NYQY+LhNNxmwTxZ3czoO9EaOP9iV+nTNEnKIwzQJlB6+j
	ZWG1+6/VXofffCACk4kPKsio+1QWxAaounPvttdKuC0/2UXcvC/SkgDcvIHqoq539jKhjI44k6p
	SFh6eeFyyn6J5M+a9y0CpZjiZRInQ8jejhRfgTxun
X-Gm-Gg: AYBFou2/yqyHSSAc6jdlVkHv97W3EixqqEDu8wId6w6vLMIuaYhzmqg60cMSW+ejPgq
	LbJBaZzy68iwXvVRAVAKcOF0miYLTttck+ecnEU1sQTt8N8po0lX4E1z9vWiaGes14FjoNM7rBH
	iVsPD38r1EWKBgB+AsiJSQvsSNw6JL3GTYrFKA/pTwClitj2R35wYftke5k5kL0lG26lj4de93F
	b7koeuHL6t4jiLcTpFpsKcILwSHzy2dGV0feWaCU+2acrzt36gH1P0jpBeYt5gJk5NrFuJpvQuz
	o3gI+iUkWGKBjBrmVU3RppS/HnfdWHsDtK99dDiCVQZYHdQgd/iYJuKEXeUyBFuU/05dSUkwDXV
	9RpSoGabwaix8HfW1Tgbn3wT5ZDWz7AqeBRlqjDaAgsKU2IhB9w8VrU+s/Ci5oBBantCl5kmCQN
	QF4BnZh5NUVXERp2SYpD606bM=
X-Received: by 2002:ad4:574d:0:b0:91e:a16d:7a30 with SMTP id
 6a1803df08f44-91eef808c9emr12577566d6.21.1794254386073; Mon, 09 Nov 2026
 11:59:46 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:59:44 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:59:44 -0800
X-Gm-Features: AclHuK90wR_z4yVrzO4MfdjN_1RfU4RbtNS-E8SukabdQfjTq985Vre6DirfMaI
Message-ID: <CAEvNRgEkS=aNPcWn3NPRL56ibPvFS1d12Rvbx6gCE-yonVgLXw@mail.gmail.com>
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
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
> TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
> vcpu creation.
>
> KVM_TDX_INIT_VCPU has a strict prerequisite for the CPUID state. To
> satisfy this requirement, call KVM_TDX_GET_CPUID and KVM_SET_CPUID2 to
> pull the CPUID configuration from the TDCS and commit it into KVM,
> allowing KVM_TDX_INIT_VCPU to succeed.
>
> Additionally, unlike tdx_vm_ioctl(), tdx_vcpu_ioctl() doesn't check
> hw_error. KVM's vCPU-scoped TDX ioctl handlers don't propagate SEAMCALL
> errors into hw_error: the error is handled in the kernel and only an
> errno is returned. Checking the ioctl's return value and errno is
> therefore sufficient.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
