Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D473E4C66
	for <linux-coco@lists.linux.dev>; Thu,  4 Jun 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607676; cv=pass; b=H6e8mhVEsTtfDn0/E6qa0JqNyci81Tya6Nulq48lQPQ7D+LQiQOKVubuXXJWBvMQWhwixCULW5m9E3AcFtDF37YntrSccIvnEeUYesi3HWmpgk7R25JoCC9tXue+dtABkG2EKQnI5FV7g3ylsdvXQtPNxgYTAFPPJ3HTekW8le4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607676; c=relaxed/simple;
	bh=3EQQ6v/Jh1n3vmJAx1K0KnEtPJfjxcjgCdoh94k7jVc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdZkIlcypAS0PHkBLEsyZmL89LS6ZaUq+arPdEI025OuuMoncGre000kuyoVdOln7cgP4LSVlGcPeaVr5JDGJ57Tg1b0UTk1dE35Tpj9P4lYAN2aSWJ5AVN+gX4QIPxd65vaYmCTj0SCm/Ug82HebUYwcNAE3Zu77KtU//vGknM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JMKLwu06; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JMKLwu06"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137f3cb3f46so2189023c88.0
        for <linux-coco@lists.linux.dev>; Thu, 04 Jun 2026 14:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780607674; cv=none;
        d=google.com; s=arc-20240605;
        b=AYG5j7ELVocCn9BoM5KXAGkorHt2gFq66X/PpbmABgwwiM34nGmC+FOTAY5tUr7qdw
         pWk5IBHh/7ShAAIv2TeXSRHDASU9oMRSDnCqx7r7alfTaZNq5AzHZ3XNf66CR+EpEKwo
         lF3kkpbCOFV1OhWiXbikTMzlpKNJAj4hDZQ63wWllQMjV/UHrEZcLdLMWZmURgH+Gz9A
         T1hIy1lHEBsnkXTSB2F+jLfl7lasM+Ff6770r8BugKJOsCfZTCC33bllJg1co3DlbBt6
         BblV8oNFKaPs8OvmdqIXxjQTKsr1Tnu6MTw3J+CkVzqzKdbtw008aGkQ8LtC6K+AlhMC
         ToJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=lyPEsnWgMEwVBTMM4vHE6GHrBW2HxmanLD1B4poadMk=;
        fh=Ze0cvU92kPAPPZuEfQHvnXHAC2ilHwp1P7hggyzyKmc=;
        b=XvWPfzKq6NS24t2A1617rRq/0VklCzRRGjrrXWbbosegfNVMhqYYRDF2QANwfhiyUw
         AGqWJWXDY4eZgwDpCRYIL3LzRLdZ3PuAlWmBBYu5m6IFcBBXeukBZxKpAB17Gk8yDjrg
         HKy6ENf8JfXMmUB27vgCg3doigozh3jxDbdwqUqStU21T99Z0pts8Ox2+0jNuXs1wajp
         74HcxS/y3aH3BUzE0+LROED8aBo8588aluplyg/4okHZgs4gp/7zTYrlSgVFzdv8UXmO
         lN+/MZF62x9aGQu0sX13rwUZ2X4DwOXoU36r+uJ+sJlnaufRUQVaLMIqhs1ixB3pBTw5
         BbnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780607674; x=1781212474; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyPEsnWgMEwVBTMM4vHE6GHrBW2HxmanLD1B4poadMk=;
        b=JMKLwu06/HZp82/zmMmxguYRc54y7S6b0PSJ6ki0p9xa46MdsiPjHXTIgVgauE5XRZ
         +92mGiNb+hkxc8Im2osiCtJllUikGeidrUxkhKItrH4RcKAi55EtJm2FPFAp0rsDkp5I
         y/TTP3pKuPhssSlYyJqY2XW2lSjvdH+nte8if/Dr7wi6Wzz7f1+Pt58HeLhqlMSUMgDk
         HdJoAPFdVatSQAvJxS2t64ijdciHuhoL9XxqttRQKR2kIg4XUQr1wnk1mB7e9qRJ2EUE
         ihQ9ZPSfNl6nRfkrF8yDOeizCAoDtoqXwRqmzOYhwHutqBdXsOE7g9qJPn8NdurRW52o
         saWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780607674; x=1781212474;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyPEsnWgMEwVBTMM4vHE6GHrBW2HxmanLD1B4poadMk=;
        b=gxXgggRW2RtwFlaTS9fPdjS44tqCFq7W+9vDIAetazwKOSDQxxFf1YVSEKr2PwDoZK
         FIoUZ7jbR4FhRAFvveLz8c3nuVdTBWaTIP8YjD59RdiK9N0L25OIaHqiKGhzzTZg0n3P
         ekz9Fl6UR7Q9oh8B8ik8t2hV0CU7M9Oc1ViKcpzoqa/SSdB2MNtDKIKb8n8Rsjgjw+i7
         i8vKb3MsEVuaeSItq8sW3V1T0/ZT+b/aNZ2cIj5ShP2RkPzlcD2nSuaezDcs8IAAWIQM
         y93nCOOYPgcxcV33hmyIiQGKSjj+IRKx7/kIcBrnO/TqWle4XYoOnn2g4jeufx6pd4fD
         X7MA==
X-Forwarded-Encrypted: i=1; AFNElJ9ml23mJNXgOt8CFoOhT/FQsJWUWjyZXLHVjh7OaoEWce2qBqvldwjB1jjR1J/SXjXs5mKAjSxhJoaH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0rp0vDOzrQwvOSsLeCKCn5lKPs/iy2YomewI7QYEDMH2ggInt
	VTQ5xZRajIqh15e+0UerhF/1uzI+cxr0DaC5gGKllJP1DbYrF00tHb9ox0VyG3I6ZMZFmNj2RDc
	bITKwo/idtU3yScdQkS1OaVtkaraNLf0LMKWNKgr3
X-Gm-Gg: Acq92OEm2vmJpqm9JfVJHnGcS4RADyldLv137/O2kzSLjdkuKUMM4dDgQbPBfsj6KDK
	cwhPZn0j+OLEVdH5FgKu2YQjLJ6Mo04T/bHOoCVOwuF1tRNNQ5yw4ldUiUEhQedMvLruEkogQ6a
	yZWtxntUkyEP3ZWaNG1me0OrixoVo7bb66ohz8e4YBt8vXDCvx5OOF/JVVus6HV34lf16UW3M7v
	CKe6GSx0Oi6h06iVkW/xqh/LDJTrJzCsmctD7jHVi/6RrWdP93tVNSVZRo9gmjL3MRAUec4Lo72
	BApox2IqBjeX36d+bPWlsrjpExbJbWVpeBt8CfSGaIEIJgbFp/6qJbO+dqM90OF9btFidaDEojq
	S+Wo=
X-Received: by 2002:a05:7300:5b83:b0:304:acc:f086 with SMTP id
 5a478bee46e88-3077b7ec417mr207174eec.33.1780607673246; Thu, 04 Jun 2026
 14:14:33 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 14:14:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 14:14:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiHeDZEPkAcWcSkn@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com> <aiHeDZEPkAcWcSkn@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 4 Jun 2026 14:14:32 -0700
X-Gm-Features: AVHnY4J7O-BvLwAbWwmNVfQCapmW0Jz58QA9MN7lFJVjBHp7oGK-p6NKEbfSA24
Message-ID: <CAEvNRgHz5GDjq0GqRmpQdHc-X45gCNr39VYWZH-T7XhPEtN5CQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Jun 03, 2026, Ackerley Tng wrote:
>> Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
>> writes:
>>
>> > This is v7 of guest_memfd in-place conversion support.
>> >
>>
>> Here's the outstanding items after going over everyone's comments
>> including Sashiko's:
>>
>> + KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
>>     + Need to move page clearing into __kvm_gmem_get_pfn to resolve
>>       leak where populate can put initialized kernel memory into TDX
>>       guest
>>     + See suggested fix at [1]
>
> That fix works for me.  The initial guest image will typically be a tiny subset
> of guest memory, so unnecessarily zeroing a few pages isn't a performance concern.
>

In regular usage moving the zeroing in [1] doesn't change anything,
since the same zeroing would have first happened when the host faults
the pages to put the initial image. When populating, there's no more
zeroing since it was zeroed.

[1] covers the case where the host doesn't write anything to the pages
and directly tries to populate the pages to the guest.

>> + KVM: guest_memfd: Only prepare folios for private pages,
>>     + s/non-CoCo/CoCo in commit message "INIT_SHARED is about to be
>>       supported for non-CoCo VMs in a later patch in this series
>>     + Use Suggested-by: Michael Roth <michael.roth@amd.com>
>> + KVM: selftests: Test that shared/private status is consistent across
>>   processes
>>     + Improve test reliability using pthread_mutex
>>     + I have a fixup patch offline.
>> 	
>> I would like feedback on these:
>> 	
>> + KVM: selftests: Test conversion with elevated page refcount
>>     + Askar pointed out that soon vmsplice may not pin pages. Should I
>>       pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
>>       take a dependency on CONFIG_GUP_TEST.
>
> I'm not exactly excited about taking a dependency on CONFIG_GUP_TEST either, but
> it probably is the least awful choice.  E.g. KVM also pins pages is certain flows,
> but we're _also_ actively working to remove the need to pin.
>
> Hmm, maybe IORING_REGISTER_PBUF_RING?  AFAICT, it's almost literally a "pin user
> memory" syscall.
>

Hmm that takes a dependency on io_uring, which isn't always compiled
in. Between CONFIG_IO_URING and CONFIG_GUP_TEST, I'd rather
CONFIG_GUP_TEST.

>> + KVM: selftests: Add script to exercise private_mem_conversions_test
>>     + Would like to know what people think of a wrapper script before
>>       I address Sashiko's comments.
>
> NAK to a wrapper script.  This sounds like a perfect fit for Vipin's selftest
> runner (which I'm like 4 months overdue for reviewing, testing, and merging).
> If the runner _can't_ do what you want, then I'd rather improve the runner.
>
> [*] https://lore.kernel.org/all/20260331194202.1722082-1-vipinsh@google.com
>

Good to know we have this!

Thanks, I'll work on a v8 to clean up the above.

>>
>> [1] https://lore.kernel.org/all/CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com/
>> [2] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/
>>
>> >
>> > [...snip...]
>> >
