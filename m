Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DFB271468
	for <linux-coco@lists.linux.dev>; Wed, 10 Jun 2026 17:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113754; cv=pass; b=ja18JbAOvjzQc+cX50xQtoreIcWH+xTJZnMQZOk70MsNXf5gC56pcd4qgy40dKDo8BO+n3t/CNWP3pmNPAq+X1TlOAbg5sDAi+ZuYqftOQtWlTj+vuE5/RoN/zlNkHnOEJ2bFzLle999Ct7b2i64208VTBZI5cNZxG41aso90SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113754; c=relaxed/simple;
	bh=8/tcIFUyKedfnkVo5NHdCiAhmo6kOi7gPaC6gM41LYQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBLQ+kbOQJuiYO0rHN7AlejFBI4DNqLOa3rqpLvYWtQq9/CBR2+pz/8yAfI6YyvlGYsztJYOLqVFZbM1HE70zMB3EZzjvuYO13ab+hGtC0MO9VqH3+hD6kyLQcc26QjSG7WfYcNcyTMMcs/wlfJbCVqPq5yckuK0tdFgItwCthw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbEoQ2QZ; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbEoQ2QZ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1382533d428so1604444c88.1
        for <linux-coco@lists.linux.dev>; Wed, 10 Jun 2026 10:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781113752; cv=none;
        d=google.com; s=arc-20240605;
        b=ja+91nXgYN/RW1Jcs1zWEQ+IJ5vbBGaAfeDHlWC20MxywOZ1CBa91gf1w5kXJureV3
         2KgPGNIVXPJZ4aB+FUn7bbjU+UqaigxRPpt6ZIg6lOxGS4rvQrzWDEgJ4chaNieMCM6m
         x6bOE9anzeyCuEEblmSR/58ptIi02EsOkv32Z/HID4RPm/cwgeS020BTC8bebtLYoJQD
         r8jYjy4PK2vOzAk0e0Ifg2lveQASeNEXW55QSTTNvaW1eWdTH1t9S8C8/12x50gpl4bQ
         UVJ5uDzgMuXhq4ipJ4PZaklUUjpltvp7FM5/YIAtLBdjYG2NxQiZo1T0VkvVtkoZuNDr
         NGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=46dTS54fJkFDX+n3fNAtP/BR3hdg+QzeIr8BMTbVi98=;
        fh=N7ZuivGxWDAkoeOYiKuD0uNh/jkP5+px9ZQjT7N5/vA=;
        b=jhHrAHHHud51ce25PYav6z/8lOq2jxn2FipOb9mGolAbYFjAuKmYvPab+9rgHM5C4A
         SicnBwALBgOxh5M2tO9qTO5Ohvd5zc7X7auay98hT/wj0wYmP8DGE0KEkWnoiNJIV0E7
         FfmB8thrsfWVj3lORSz9h1ZsLH6BEsI6kDeTVEEoQIrbprrhksiNaQN4foW9FI2KQJCz
         VNXeLsrKGEI1lIXQBao4+CHgSD+cLVLJswZ/T0cgtMvKhXCq/jVvXk21VQjI2lNiDcdG
         ucYqJiFAqOBNrpREgxvRiDaFhO1kyAauUtY1F2sFZphXE0FeEY0liWFXxXoVoyAJ2V+Z
         Gm2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781113752; x=1781718552; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=46dTS54fJkFDX+n3fNAtP/BR3hdg+QzeIr8BMTbVi98=;
        b=tbEoQ2QZ8MS/RWbM1JWOLvLNxY8xOUC2hB7aXRWGSkHz7tASMLoWQ4wsOqKIJHM9Nh
         1Fa89AXU5+V2wItORsUnAyqojsCZnAyuOcv7W/rGAyqaaZZRk0j2wIY52+GZ+QxDzh7Z
         7N+/WkDpsc4yFzVIcd88Dd65N7E7PilIaXE+cyRiKWPKHKR/QuhTzAxIf+0UhWGAi4kx
         CW7SJEGnXyYO6TtSZsfUGJUYX10TblxmVLf/5ChEyDuuf+YxC2Y6q1BwTpPRVhv+1YQg
         qKuVOPItv4JdLB/Yufb3jabwQQMk6lPzZ+Y8o/zMKHl46Tq0HX6GgrZbjN2wMnarD3/B
         ngvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781113752; x=1781718552;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46dTS54fJkFDX+n3fNAtP/BR3hdg+QzeIr8BMTbVi98=;
        b=Cz3h5BCtCn/525MWmO0PvSOGFI2lyf7rhSwkEacNrKkQ1li3x3g+5unm7rIRJV85SZ
         Rb6GFCNhM/4ZPofXSjmVMEbBa/3x9tSeR3RXprJWp3x6rDyrhqIYCxY/22YsAcpf4sJD
         K1nCIcQaM5tD4rgylw72dUm3yrwEWX0Uw3bCsQC8Hpy+aRuDR16ixcwDbXfeOGexeFQm
         +PazSdE/02FrfPpHwnNdf22iaqzpcpCfoQFubcyJCjkZ0+UjsdfznboF4U3uVzHHoRfB
         zMjarJcGi3ihb6kbGAkt18XIVNhGCnFm57BPBUDpO/RvbVKZ6uq58xps+JKvWOaDJxp3
         gt7w==
X-Forwarded-Encrypted: i=1; AFNElJ+hufZKlSDIb7V9Rnxc+2mUXFW3F8S0vL+64qmx2Pcndul5WSTFmgw8TmGB8r1pFC2pRwNok6Bi9Mof@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7S4CLEDVUbFtJYek5V2CakJ4Vb1E5J3aTRIjwAhqrEM/bBQg3
	Rc+BURkNxLLZHh9pnqYINGB64wdDpO8NLLMyf4IxC60TD4h4UhAjeraWROfYJHR7qN0gASrymQF
	lzF/Fibc1KWRYJq/hImJynIDpPc/t87QO+QBCtK5l
X-Gm-Gg: Acq92OE7xLmp6R8Ze8oZ38LhNqaDg5Zm+oBk39Ewi5JZ5RR324WypJoGF13kLY68BGZ
	fFTv4td41a0fX5ChfRjOc6pa2yDuvu0tgecfWNtyly3tNGcF0s2S3T3ce6V/CmG4DV1x50lnFag
	YrB4Bo7q8emg8QSlfFvLZcGh0uZcdFvkgjH58smBh7fQN3Pig0Vy7NJPAztnXjxrXncf2o1SMIW
	uWLu0lsrKyo/f07WVCDShLpZlPtIfMYr/gjmKJHGngpRYNnNLBLl12fav1Tm8QRmi4ltLR1AIfN
	4vxuJi7tIKniGICwepNtkm3V3emiCMBlXGOhoxLcC7TS70h49/mq6qw2AeBf6s62BQyFhG6w/Fj
	PzwLe
X-Received: by 2002:a05:7022:6b8c:b0:12d:de3e:52c1 with SMTP id
 a92af1059eb24-13840b97c4dmr92377c88.37.1781113751391; Wed, 10 Jun 2026
 10:49:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 10:49:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 10:49:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiMVLtblIKu1DQWJ@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
 <aiHeDZEPkAcWcSkn@google.com> <CAEvNRgHz5GDjq0GqRmpQdHc-X45gCNr39VYWZH-T7XhPEtN5CQ@mail.gmail.com>
 <aiMVLtblIKu1DQWJ@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 10 Jun 2026 10:49:09 -0700
X-Gm-Features: AVVi8CeVNL_ZT6N2PrMDnjQ93ySm3TRS4viAqGi095JXk89KfuwRXMizMLlfDgE
Message-ID: <CAEvNRgF31BzyFyVUa7tDJ=qJ-8ws2kxfNjLxmV=OxKSqhaOiPw@mail.gmail.com>
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

> On Thu, Jun 04, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> >> + KVM: selftests: Test conversion with elevated page refcount
>> >>     + Askar pointed out that soon vmsplice may not pin pages. Should I
>> >>       pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
>> >>       take a dependency on CONFIG_GUP_TEST.
>> >
>> > I'm not exactly excited about taking a dependency on CONFIG_GUP_TEST either, but
>> > it probably is the least awful choice.  E.g. KVM also pins pages is certain flows,
>> > but we're _also_ actively working to remove the need to pin.
>> >
>> > Hmm, maybe IORING_REGISTER_PBUF_RING?  AFAICT, it's almost literally a "pin user
>> > memory" syscall.
>> >
>>
>> Hmm that takes a dependency on io_uring, which isn't always compiled
>> in. Between CONFIG_IO_URING and CONFIG_GUP_TEST, I'd rather
>> CONFIG_GUP_TEST.
>
> Or try both?  If it's not a ridiculous amount of work.

CONFIG_GUP_TEST was tried in [1]

[1] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/

It looks like this

  static void pin_pages(void *vaddr, uint64_t size)
  {
  	const struct pin_longterm_test args = {
  		.addr = (uint64_t)vaddr,
  		.size = size,
  		.flags = PIN_LONGTERM_TEST_FLAG_USE_WRITE,
  	};

  	gup_test_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
  	TEST_REQUIRE(gup_test_fd > 0);

  	TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_START, &args), 0);
  }

  static void unpin_pages(void)
  {
  	TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_STOP), 0);
  }

So in the test I'll call pin_pages(), then try to convert, see that it
fails with EAGAIN and reports the expected error_offset, then I call
unpin_pages(), then I convert again and expect success.

Are you uncomfortable with the CONFIG_GUP_TEST interface? What would you
like me to try with CONFIG_IO_URING? I'm thinking that the main
difference between the two is just down to which non-default CONFIG
option we want to take for guest_memfd tests.
