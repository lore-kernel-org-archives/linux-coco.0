Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E696630C637
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260082; cv=pass; b=A6004EEF9gEqD3wCejj7LDtKPB6BBgxtOZcBKXTLPXdZKrn6naNWABmck3P8Os5Gy5PUeAKAEA1Xw02x17AoxUsaKXUtRqdfCHb0ZNJxQQVHjvnxMBjf8VZadejeeIFnQ64myWwDiKZzMvGLH2Jmd66+fbptACNDpS0/rLCrQfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260082; c=relaxed/simple;
	bh=kcSIA8QoE0LN3l35tQtfo0jow3WHaPbc3lLYMPju8ik=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAckUalAg5suVgJUltV+f/Jz2/SqNfmfBaBbOm1fCOnPUAg0adAyyVV0fYXJvPabz6q13sRSuEo44kgVLp0WzxAF6TZ7j0uFGt6tQiL5bl7CUgLNl80IjSapEBy/JtxqzYaGISAMAQNZdIHB9m4qzpC30mRYXZwK8lpuWqsLWZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ii5qumqZ; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ii5qumqZ"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13986d61b4eso901036c88.0
        for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 17:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782260080; cv=none;
        d=google.com; s=arc-20240605;
        b=Rq6teWUrro0fv3UDzHbdn/nUx+Nc5mVLuKgX1zDh/MGSshYwmWfmnYgFWOJsO0Cwo4
         xt8WzxUcE1SRpImNgi6bQhEDVl9dYsdgMS+5BYfixDap3Pf1jryZsJpK9Ti6Ro+I53Z+
         T4hZUv3WLoTsOurKhzbiNNoafa/LmZtOfWdyS9yyKo1z4a2LvbsCnKNWqLK31OluzC0t
         8NpTkyJG618Nt6LntjtvOPX0V0SGmFlrClyWlhIamPdeX0HIjjGynfLg1zu/t46sWtQ9
         o5GBDnzXvqOgBfdwx2JcFl6dRbV1z23LaOYojb9/W2RoQEB0ytfQyrGobbGBS9JHpILA
         HIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        fh=zD8IHVGCa5SrdZ2PuEJHLSUZ/W9ysvKAVEB3VPj3AL4=;
        b=cMsV7/SLPA8eWJNB5ciKl2hBU2hZqKzUuMojULrms2KmSbu4KwpVrT/0FxQnaXp0al
         db7ghjm4Aygv/jW72jRxAZgfYSFQOMwPJHiMjzledjLx9sX0Cqh6wE64dNXEYDi3V50+
         DOGnh5DaD7CKNzaBFDSANM55EFz8juOCjzHWgKOkFkKlT7j15malnr2LD6LyZ1JpIbH9
         mr8f6tT35HhdFcTKxdTAuzjyGdSnJB6utt6dtzxQSVWmFVf5YthoW6RLbspNWIQNKCVY
         rmZTR3ejmf1TDDTKoQ2K+3bo+fochjgkEBTKow6MTYd4HgECa0cCZsTfT1PO9THvV0e2
         1Jcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782260080; x=1782864880; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        b=ii5qumqZ8rBbbrXHsKcdKq0CowVMWk3d0jbtx8m+HgySc2Ks2NVF3DIQXEDI3D1UYd
         1BHa/Bn5G/yZ/Pq42VPHwwt1cuE+WcDbc+a4dHhsVByqpRxKa3TSWmR4fCsmvUNPyVgV
         ey6fB47wYAcXJYdiXY4FEkIq6hAEU+KmN4GSDfJkWwcbN95vT6znRZqzH20TUioy6CmN
         7+SO7RjhB8zK1BdUU/0d++f/jKXSzrsJvGbOE6Bljkn0DgSZ/PXrYcDfkdmqAGMZoTKO
         8rZAqRqfBWig0cdlv9+ZgnLRnRLDm+3GapNjaOxwacO1YXczU4IzbRXjHdvL9WX7JFc9
         6YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782260080; x=1782864880;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        b=kgUG0SsHr/GqMFPCcGsWolxSIKfnINMYFE4UAHo13hG+8MrYIsjogGt6jubTIFrxXU
         EGqnGJRL6Aae4ljTBRx7m1cH54a0/jGTx/kTAdURoTHEWQjtfsRRBwmTeaJlpSgRetOx
         ZKLJqW7MDEua2RustUVQFM8Wol52qRVwia1TPNb+kimgpRF149E634VVU5IkkGYbuzAz
         WCd5LsWSVbuHnml9ResBdQfAJJnolmaaNQRWdhipj4UaaLhbeDO5RAzscgHrGfXNgl0h
         B3gO1qPGrbKGMr+P+Sl12fAtDZc4Sixn81skSdqe5JUVNNVcUa6XkcGxpbXhVumfly3R
         P+wA==
X-Forwarded-Encrypted: i=1; AFNElJ8/pIPaI2wJCCf+RPUr3bKZUCI2zF8/kQWmXiZX8C52OkHnRcvS9ES4kZ9VzhdcAXrMVCMI7CfXH4uO@lists.linux.dev
X-Gm-Message-State: AOJu0YxVVRJOmKj4/4xQ00pjf6ydu+RWoYJOBfvYCr0W6eh7vOmVRtwi
	nqCj28OxAF2bJUOez2yHS53Ytw0dKcdakq5mdJ2i2SKDWosIu+IkxBIxBbaHn2P33al6Pn0GVsT
	sSwW9L2c2lnDTbJ4bkT1EdD+81bjz7GyrvNlBehTA
X-Gm-Gg: AfdE7cnOZOLwiGliioVTKiyBQCOM8GOcg3LkYT78woe6j6cWv/E+cr5L1ur3W8pAYMb
	h9jBTccPgPypVR3FfLRFpav6ZElUnurBJYDazkYDk2UVrnVzeY4omZckiEX/At/znlpN45IouMK
	duQbgrWGY6neGsn1kNTU0H3QQggHJ7BzbexjwcPSHOZdow2CVgESVsAAdjNRYAUkfCSRRc+mz2e
	CzIXiC40cuwGmGkU8nBPKJupaguwkPJIDc0Y/CtWg0ZgQZ02LKmntthEvc43vbMS49CEcVAdecI
	tZOeAqNJd+cJjuBKu1VFqXxj1GoKXaCXX00ciogoAYFRRBp0374s+OnOOEI=
X-Received: by 2002:a05:7022:7a4:b0:136:5e4c:7aba with SMTP id
 a92af1059eb24-139ad6ac8ccmr13781633c88.16.1782260078995; Tue, 23 Jun 2026
 17:14:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:14:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:14:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajnQVkLvFl_lMuGB@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
 <8e53844c-f2f8-4a4b-bf72-f3140c170d43@gmail.com> <ajnQVkLvFl_lMuGB@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:14:38 -0700
X-Gm-Features: AVVi8CcXn2j2iTyhoMEqe261E6HKS7rSa97Iz0Ayq-UgAfPllC9cKLpff9jWWSE
Message-ID: <CAEvNRgGhWL-tWfu8EHf-zsU4C127xKT2wyV7wMBnLKs8g=pEmg@mail.gmail.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
To: Sean Christopherson <seanjc@google.com>, Julian Braha <julianbraha@gmail.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 19, 2026, Julian Braha wrote:
>> Hi Ackerley,
>>
>> On 6/19/26 01:31, Ackerley Tng via B4 Relay wrote:
>>
>> >  config KVM_VM_MEMORY_ATTRIBUTES
>> > -	bool
>> > +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>> > +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>>
>> Sorry for the style nitpick, but could you keep the type and prompt as
>> the first attribute in the Kconfig option definition (like the other
>> options do)?
>
> No need to be sorry, I've no idea why I put the "depends" first.  I don't even
> know if that qualifies as a nit :-)
>
> Ackerley, if you can provide your SoB (for Fuad's feedback), I can fixup when
> applying (assuming nothing else necessitates v9).

Thanks, didn't notice this when consolidating this revision.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
