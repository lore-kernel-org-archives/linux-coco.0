Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB343E49A
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656245; cv=pass; b=IeHBy0SJwSPjXxYb+1jf70K47zRl54YTnC+pspjFXLsukeBqituT/iZnDIxI+q9n5twQdW1MvSp8Tj9GbxnNCHOMPe4GuDJ010JEXzNgLbu3ymVDzSGuTOtHXVYiw2uCjfCqVoonBiXTvivJYySthWPtWrLeEAgd9QxNIMmvq3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656245; c=relaxed/simple;
	bh=qX1IR39uVwaDaiwu+D13suWfX2py7eKUr7A0OiCh9ro=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abUTOZZww6QiVqmgP9Fjbak7IlRNiAT0F3ThNgEu6CcL5lNEssKL2wXTWRVi8deRsa7IFbo5bQ2gD+B6GTydfY4YjbddsRDcZkrE7G4CGPksJXcBJYtQkBbxgpyuMotvAe1iD3+LQIAROq3aPv9PYDUroeAbe5RJXvgzMq52GnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RwJd9wrS; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RwJd9wrS"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cca0c5799eso3911015ad.0
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 14:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786656243; cv=none;
        d=google.com; s=arc-20260327;
        b=jpveIOP1X2k+H6jhc6u2jolwJxtRC9MZGzftEAVtGqsBxB7+LOXoLr0/BadJBwrz0X
         COulrlM5wkwQ3DU2JO7orsvNcOZ62K5MrTnO6tVpxs+R+bxXaJFgXBEUf0foBxDcbYeQ
         WdTpYjSLSqgsp/PylECLNFTmtla6pcYZKUOwT7Gsa3qAZytZViwrwYFXz2KKwsHrW80c
         pNc/Yqgefs9DiCHeth/ch63SldUGebrrYbWhAg2rHHg7e2MZJnGAn02BsFkKmZ1n7tDt
         sFBf+jvD94dpQwsnvLH/rMlXaHFmqIp0znt4kZyo38O7YYWDlubHHEUw0hdNTW4epFTF
         hz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        fh=YnEinBRsO3md4qqJIc6klbGI9sVl/kuBCxLaep10mDg=;
        b=HfhAk3KxgPMtJyyzbuavhf3b85hkENoLFFO7eAY3CRWgk4kqzwOZJwjS53KU5/gdiI
         8MrTB6Mx8VIE+Yah0i9jwbAykIb7nedu3TNZEA1wpjuo6TR0lje269SFuQwJ+2CAMGH/
         8E+76tN4o0kfamsNCNXO7zA8mZx/Ktvu9IGZyajTWpz3j4q4D/YxamhNsLx8QtQ2H8V3
         LNZ1EFo5M+hBk3sCXLAIzrMjHPtXhERt7KVnRUQ3brHrXjZ5IpOTqC48OPy8mvmbhiBf
         e/qSqqsSmNyGwuohwQfVNkS5QeKQaT+VKNkYKcLmvgF+hqFLzivDMA3mQ0EQ9lFzjJYH
         vN9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786656243; x=1787261043; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        b=RwJd9wrSuH7VHiipMUvAokF1SS6x7HGVCdPLEZyuGAZ0wv/wTgIjHGkFdUaO/Sq1xN
         ZukwMnmh1gP+AtZBfeRypJvGrQ0ROnLPjMvPO72FP8WaAArBR09y0tugwUlhJOu+ovTU
         BqOXuTdKHsG8rfFqf+4+r21a4k32IzEr70qRij5riaDa8nnWMU9YGvCouyV7nDmnM3cC
         h0OQznH+hvm+5S5QRREHjgRl5g5as5/Fn4LEguP+y0BHk7QyfXSNJptXsgFcsoUqp+Jr
         bUx4rNheUEH4F8ECbkAkQo4gSPtRk1ynxPb5rHqCELxE4muVdQRuepLlSoHtko5Gle3U
         6l5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786656243; x=1787261043;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        b=JE0wFuG9J1V5Migx5uzOQoWZZ/D+/AcIlIu5aB+uC8r2mBNgx2ju9TplHgNE9h2LXn
         BPK1KOF/beCX2j3aUfHO2SQewlaIhK7WuxXDLPFVRRc3Zw6NHe7weToac6486uyj4ccQ
         ouB0EnAzcLpE2+QH5meyKFUwolhoGcWVG3o3xEEnbesmVib83R+V6+FcWMj2X15HSrqk
         QSEZDZHogBIMSS9y3Izc9/F1XoZWiPRUgScHTXaiwHgfKvf43OlbMmWXnyFlKWL8A+dD
         uzknJbmxNYibTbsO7SnAMDDnmLSQlmNYxBzXHsO4bLhV5tYGib5Ix5HluC/T7d4NUh3r
         qB4w==
X-Forwarded-Encrypted: i=1; AHgh+Rqhf17OAR2knKZ/WKVi+4yiH6g12QLTvU61KQYccFDGVzc8mAa3chv5Ry9iY76yE37A3tgn+EpTZ4Ya@lists.linux.dev
X-Gm-Message-State: AOJu0YwxhKp5/Aq597lcqi6wPyP24y+ZII5SYPxWD2zNRg3P59kVcmiO
	qpsBYj0zoQiziZOu9k1wQ8E+Nnuuw7ExpTFLBh+ACHYfBqn8DF+N/+uC1xcvfrLZE6Lp6bkh5Ya
	1cKkeVFALoNnptMrj4Bb2By2vQUczKdq33KIvPzFQ
X-Gm-Gg: AR+sD13tvXSGt3K04jeMTRPtCFS5yGDJoLZz+bDOmmWYsg18wixWSWiaLLu5OVQBE3I
	1wRtnoFzhvdGhUN+qVPs6iq2oLM4P4ohhkppFnpyEkReHcUzVoa4KHNZHyPtZaBfFn5vNtxhYQ5
	z+ZnX88o7r0g89TgUAaFsEmK8HtD+Dxi3ZAzr5Da+UbgTKAAzQcJyZ4qdcDodt9I3jE6RHu+Odj
	HXrKplqLDFnZ3HgeXcGwqt/rvetQZkiBrJl8Bn08PsitteiUpMmZCui6WorxmT4rhegycNIa0KV
	H+67lPvzp0MRie82B7wwUjNR5TWF/ufw3heEylDJJHEqh97HVTQR9c2BVJFqpIpR0mxbmsaPR9B
	rJEv7behZePl70fcgUr31BQ+AGA63nw==
X-Received: by 2002:a05:6a21:a4a:b0:3cb:d156:d362 with SMTP id
 adf61e73a8af0-3cc7196e785mr831997637.3.1786656241969; Thu, 13 Aug 2026
 14:24:01 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:23:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:23:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <82ded1ea-e0f6-48d9-8bcb-38a6bc5e9176@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-20-2fc18ee6d3ba@google.com> <82ded1ea-e0f6-48d9-8bcb-38a6bc5e9176@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 14:23:59 -0700
X-Gm-Features: AUfX_mzbri1ixV_zlf2Jna8d8Me5Qvc_rxP8xrcIgsSaQjjAlnxnniHAuo3sYt0
Message-ID: <CAEvNRgHpy52iynKfXeEkyCixhhu0_Hnu5jSNT8i+BNxvEoG7Cg@mail.gmail.com>
Subject: Re: [PATCH v10 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>>
>> [...snip...]
>>
>> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
>> index abb108886733a..2c3c22aeafa54 100644
>> --- a/arch/x86/kvm/Kconfig
>> +++ b/arch/x86/kvm/Kconfig
>> @@ -81,13 +81,21 @@ config KVM_WERROR
>>  	  If in doubt, say "N".
>>
>>  config KVM_VM_MEMORY_ATTRIBUTES
>> -	bool
>> +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>> +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>> +	help
>> +	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
>> +	  memory attributes.  Using per-VM attributes is deprecated in favor of
>> +	  tracking PRIVATE state in guest_memfd.  Select this if you need to run
>> +	  CoCo VMs using a VMM that doesn't support guest_memfd memory
>> +	  attributes.
>> +
>> +	  If unsure, say N.
>
> Hm, does that imply that a distribution that must support both, cannot ship a
> single kernel?
>

Did you mean this as a documentation comment? Should the above read:

	help
	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
	  memory attributes.  Using per-VM attributes is deprecated in favor of
	  tracking PRIVATE state in guest_memfd.  Select this if you need to run
	  CoCo VMs using a VMM that doesn't support guest_memfd memory
-	  attributes.
+	  attributes. Select this to defer selection of where PRIVATE vs. SHARED
+	  attributes are tracked to KVM module load time, where
+	  gmem_in_place_conversion can be specified as a module parameter.

	  If unsure, say N.

I think we should do _without_ the above clarification since using VM
memory attributes for shared/private status is intended to be
deprecated.

Is it fair to say distributions should not support both, and if they
_must_ support both, they need to read code to figure this out?

> --
> Cheers,
>
> David
