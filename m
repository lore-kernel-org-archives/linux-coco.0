Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C2353A6C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jul 2026 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924804; cv=pass; b=Mo4c78c4Go6Ngkj05BM722R9sXdTIinkZdA+JwNfWMlw8HV/cY1pkWAyS6gCIk0sAHh4N6in/Ih/fz6i1GoDAlfJoIfF9Mqr6WADBg4/AiCeUg1Kusc58Qyslt7yE5Ee5sYOSsCx5rDYI6sw2N6McBuyJW2oXLhUmJ7+a3qjj/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924804; c=relaxed/simple;
	bh=3bPaFfkcLVVehjWoKc7uXp9Krk+zpZKVatRaC5BCI3o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNDFPEr2C4f3Jm7yQjCNDhMPXKOymyl2F1FHtqWTgc+vSEr6YY6b686kjg5GuZ1gnl0LOCzROx4YedqkgUTIO3G9KG28XPgtErEgZ9DBk6YFh8CDkLvkC9ebw+ULjP2yGpWGJpOeQflAvglkgxtTOnHcp486WL7jgWuwRz9dy/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gffXkuWm; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gffXkuWm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e88b60121so723468a91.3
        for <linux-coco@lists.linux.dev>; Fri, 24 Jul 2026 13:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784924802; cv=none;
        d=google.com; s=arc-20260327;
        b=BnoQjbvL6C1CRNSVwkCuvEk81ARrfX7G7bA7yAt+IsTl1yDoI0z7U5SpK5urYKP781
         LB3TY/8ty03RNrymd1RuElEbflo0pzvEVhR7oYX/2cWTwM2IS3tHHgF77UrL7j7/0Z1g
         H610rPbjc/S14AH6zFK3Nwzri94g/89j2r8QtfNkcPTYXeWZR9kNybishgSSDREi8tXZ
         ryAlyK2MinJ6SBMIlKbrpB6wN9itVBrmJe3qeCpa/SRn6hOvwZb/xxTzigq8J7+0WCHk
         93FzEWwKrPXuyNgtiHLREvgDiPEewmJWsPcBzHT/cnCG8/G5via73u2584mI6j4OZs07
         iczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=j6WRuRiOGlrBru4rjgXozk6E1Vpz9Ly8EIjgzHznenQ=;
        fh=j/BeV/MbFxKWe9/HUW6iv9KiSA55KaZymoRRSpKWFuI=;
        b=Wh9AHkvFb44V9OSHYweprVZuHJ0WUheHfO+zrPxynXmcMek5p/gT+rMmqTyhJr49AL
         J2Q4V/EFQfcUhgJJ3tGW/AFzm8cWGZYt9p93ujsVqfWDUEMubRsqfeWomr4BrPGyPEMs
         lE5941tfBW9A8OGHs6v7WsZFp/Y702T1cfxE1VoL7zQYnVL8v+aYcsnLdU8HHqnhymlH
         DgGz+Pu5TADoUulrLPShTyjyYPAchU9ODcq7nZtXrKbHxBZReEY715edK/tvqTicf5dY
         z8DJpj0xE9HkODH4iiurd8crjFq8O+7Rk0TfGrFc9kFkZaMQQaMG1GDMaBKfS4nOFwXp
         k53Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784924802; x=1785529602; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6WRuRiOGlrBru4rjgXozk6E1Vpz9Ly8EIjgzHznenQ=;
        b=gffXkuWmg7epRq/BtW06+sB1/p3jizJLMtyMFEj2drjbqK1WkZy10AB9vbO1J9VUdX
         1409Qzx1Ifb2w46YV5J1Du5ip3sMyAHZKZgJD7BRwr3WHUYnhoxrKzJcx5iEWj5O3K+J
         MFtqksueu6H+4cwdU5YPMiv6faQaBRZdwQph07HCxWVXvUVd30+ubAQ6uTSzT3TXsJYD
         YDB3LAattZ/o0QHYcqF6zIK6KubOke/6BikWwPX5L4ohSWfJogiroUK8hhudaT+EGr0k
         PGhzjXJ3UG9QEiUNgwgLaw7Bi0bMTRQjGN0rYHobQZ2zyx/TNbaVl5qt4aWT/V9puART
         cMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784924802; x=1785529602;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6WRuRiOGlrBru4rjgXozk6E1Vpz9Ly8EIjgzHznenQ=;
        b=Clm2tVYisTn/6/InwmE8BuCNRNkukOOl/mAuLH+pL13xG1Ub9dWtmKuMdTUe+dyP90
         IOqSljO29Gj4uYe9ru+1eMiq5pY6CNLagonA3CYSCF/JuS6soKsV9Aa7VLFVG+krfcJJ
         onzplek+O30KVEYsI+3CACaDpCaoPK5uuUNJbzvSHnFZaSWZFL1eMS1vBjzHWin/oECH
         0IJGi32X9DkrhKjxMK+92ySGi2eShTgch2x6azdHmmNScuNh+HoNpS/1PoAo2aDOGLds
         QhaiCy+82OCPLK3CiVQeBteU0lbHmYOVsVmukrexjIVTCSbgMYyVxE05pz8OVcsVzOYG
         pKAg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf5vn/k4bzaPpwVN+wvZWNU+FIgtGvfGaTEaU77Rwh3/9u/Jcim4Mbgu5/Yt8xCTIRdHZIORFEmlnN@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6PHJvtydMyByrSAD8FtqDzb1LfS8a1CUh2VcD548HmkDfDi+H
	PV6NBSihNiibN68lA8vY75pxpiLJupjEUyTIBQSCO0jMAZetEAs0We6bOs4m4uNLI0U6y11Fh8K
	Ui8BGsGKOVNLbU2QvU7eNsr1/EESR8ZLl4AU1Yyb8
X-Gm-Gg: AR+sD10ZqJF9TskiPS49kIwb+JjtpPg0w9LsFX1uk7rKEvPxFJxK8lDD4zuwX5RY/qS
	EbGat8anthJuX25pKQKnNbKHKbSAh7ITbSlIkD6KFWtc6DDTPIFmDF8qGHdevRFB5wnK5O80cmx
	fffNywY9ZhvR5f3Iz+zz+a2fgk+rveXtF5ZJrHS98SBDKZ0D++assTyz9NnMCKqlPVBEEw7g40W
	2sebvaEkNi4AWID79vcJU2jMIV2T76IjLjejnfhPl8CDQWp94fKwQww5SAeCz7jRjOVdUabfuMj
	3UIwjGmyErhnLUv5HQvoFH4gN61I4e4sazHO/x43GVGZzhb5
X-Received: by 2002:a17:90b:38c8:b0:38e:b400:a860 with SMTP id
 98e67ed59e1d1-38ec642bd98mr9249020a91.13.1784924801177; Fri, 24 Jul 2026
 13:26:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 13:26:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 13:26:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <c0e2df0a-19b2-4234-b0f7-41e010452b06@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-17-9d2959357853@google.com>
 <584a8f9a-1538-4f8b-b576-75ef0fa961c7@intel.com> <akU7uAKb5E_Tklx-@google.com>
 <c0e2df0a-19b2-4234-b0f7-41e010452b06@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 24 Jul 2026 13:26:38 -0700
X-Gm-Features: AUfX_mza0pn9bFWoM_88BD1HVQ8VVpLGhsBYWrYX7-3MlRMmF5M63UsjEJ6b88s
Message-ID: <CAEvNRgHmhpP=Re-RzojAp7E3E-TsdoUPhtZ6eSW4bf+5RVbzew@mail.gmail.com>
Subject: Re: [PATCH v8 17/46] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2
 ioctl
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>
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

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 7/2/2026 12:09 AM, Sean Christopherson wrote:
>> On Wed, Jul 01, 2026, Xiaoyao Li wrote:
>>> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>>>> @@ -4969,6 +4973,11 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>>>>    		return 1;
>>>>    	case KVM_CAP_GUEST_MEMFD_FLAGS:
>>>>    		return kvm_gmem_get_supported_flags(kvm);
>>>> +	case KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES:
>>>> +		if (!gmem_in_place_conversion || !kvm_supports_private_mem(kvm))
>>>> +			return 0;
>>>> +
>>>> +		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>>>    #endif
>>>>    	default:
>>>>    		break;
>>>
>>> this looks inconsistent with the
>>>
>>> 	case KVM_SET_MEMORY_ATTRIBUTES2:
>>> 		if (!gmem_in_place_conversion)
>>> 			return -ENOTTY;
>>>
>>> Well, the check of
>>>
>>> 	if (!kvm_arch_has_private_mem(f->kvm))
>>> 		return -EINVAL;
>>>
>>> is buried in the following kvm_gmem_set_attributes(). How about moving of
>>> kvm_arch_has_private_mem() check to put it along with
>>> gmem_in_place_conversion check in kvm_gmem_ioctl() in Patch 13?
>>
>> Me confused, patch 13 already adds the kvm_arch_has_private_mem() in
>> kvm_gmem_set_attributes().
>
> I wanted to make the check in KVM_SET_MEMORY_ATTRIBUTES2 in Patch 13
> like something below:
>
> 	case KVM_SET_MEMORY_ATTRIBUTES2:
> 		if (!gmem_in_place_conversion || !kvm_arch_has_private_mem(f->kvm))
> 		return -EXXX;
>
> and finally, with the introduction of kvm_supports_private_mem() in this
> patch, it becomes:
>
> 	case KVM_SET_MEMORY_ATTRIBUTES2:
> 		if (!gmem_in_place_conversion || !kvm_supports_private_mem(f->kvm))
> 		return -EXXX;
>

Is the request here to make KVM_SET_MEMORY_ATTRIBUTES2 return -ENOTTY
instead of -EINVAL? kvm_gmem_set_attributes() also checks for
!kvm_arch_has_private_mem() and returns -EINVAL.

I'm about to post v9, which squashes the patches as Sean
suggested. Please review v9 instead to see if this concern is already
addressed :)

> So that the guard for KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES and
> KVM_SET_MEMORY_ATTRIBUTES2 is consistent.
>
>> That said, the ordering here is wonky and misleading.  A cursory read of the series
>> would make one think that waiting to advertise KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
>> makes it safe/ok for KVM to plumb in support for KVM_SET_MEMORY_ATTRIBUTES2 over
>> multiple patches.  But that's not actually true, because the ioctl becomes live
>> the instant the code exists, userspace doesn't need to wait for KVM to formally
>> advertise support.
>>
>> To further confuse matters, it is actually safe/ok to iteratively add support,
>> because it's all effectively dead code until "Let userspace disable per-VM mem
>> attributes, enable per-gmem attributes".
>
> yeah, before patch 24, gmem_in_place_conversion is always false. So
> KVM_SET_MEMORY_ATTRIBUTES2 on gmem fd always return -ENOTTY.
>
>> So, I think we should go a step further than what I think Xiaoyao is suggesting,
>> and fully squash patch 17 into patch 13.  That way the reader doesn't have to jump
>> through as many mental hoops to piece together what is happening.  It'll obviously
>> be a bigger patch, but should be easier to review/understand overall.
>>
>> Oh, and that combined patch should carve out error_offset straightaway, so that
>> the full uAPI can be reviewed in a single patch.
>
> It sounds good.
