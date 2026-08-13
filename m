Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A2489866
	for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647100; cv=pass; b=Km56ytfhwr8/jCxFBClo8lwAjYM+TuBE1dxBzEpjruGnOvjAY/ZmT079AfKnP6eACSbHrtdKkOsSYPzPIqQ4xKrDzDZDtIR8JB+PqvMFqSkXtD/5nK+hEE4RaAxRABx1/YIF3biKEJe9iWQ7K/wk/LN5OrN48ZOoXwofKx10Nbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647100; c=relaxed/simple;
	bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMuARYE7s/caR9dXTLfCTrnSuxj1p/TUxLNsEjbl2DKm4dFYW79FOOIvpGRIEUwLkqt8xgiX7amfiJ66/Ui2ggCo+/NZob9t7XpudH9GhRCpbgeBY1sZb9OEThlNHJ2/h28nsIqMaD8pkqtEilDeaFJQ70lJa9O6644nXfbwl08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P1QwXeXu; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P1QwXeXu"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so89187a91.0
        for <linux-coco@lists.linux.dev>; Thu, 13 Aug 2026 11:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786647098; cv=none;
        d=google.com; s=arc-20260327;
        b=rEashfselj8yDllwdiGq/XdVd7lRE6NoTCReLfhW/3WcjO58YFOWJbbincIC4UVDOH
         8O3MLevm2cTtvwJiRtuyT8rM6EqsQmzzlkaUbH+ahXY3Tb86cZKZNYMKVHGGkKoM4Enb
         IGcWqkCga1vfr/Nf0u/G6TlzNqrenj9iRTN+KwKmmcXaubNoqKt6iE0IcdXGdRLzn55D
         oLX6Xzn2HQSHs5eUNpoPnMUJobmUBLkys4vGGuRZvOCJfoXM03LPZsiRawYZwDG1hUDe
         JuUfUnsVuo4iSS/oa6bbiSRfjlzE/qUq3tS017dMr/+WjT9vXSYoIwIp7l9wyqpIVH72
         vQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
        fh=+oABdlR0b5lVUkhORPEmkH5RSTb/9ri1kEokxzx8SlE=;
        b=EOt9YC/PeOHYCymKZANsdClc4LxpZcJhmALhkntmigMfBcBEv3aYtSk+vqScWDJdA3
         4Wb82QAQPbtFeQciWaPZLixamDn5Bb7DGafiWFJMYwJVK5B0QJt6DEe3d07lK4c79zBj
         ozjtnpxLBSQ0qed+kAY8XulDXwPNJjsRi36ldT5CR/6l1Lz0nSS//EpfhYlpm2lqwjcl
         Xbh8obDbYuKH5IacUu8pgc9o18y/g3ruOIh8GnuK9p6elhuzqqNIatw/cBdAaDzy0JGa
         10CJCMiBSC6FKTbZ3v0U1niRYsMPjQqEqiTpCv8eOESSDaaIrhGTAKXIyxxRy7fDnTPL
         THHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786647098; x=1787251898; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
        b=P1QwXeXu3pt6ZhqJ5BrH4FPvlu0H1CVYOF5cw6rlPo/hDRDVmnmBMcvC4JucwJPar4
         HaGtGuwI2dubJ86qF7WfhKSZkU8IZE4O0OE88LxNMPK6cNN7Cbpdb93BD50bBhae9b6x
         QkKFh9gkHnp5tLlzxIVAZfCaGrtYHd4FyfEoRKh6e4t2GdiK9NchCBkbFrRBaL6tC5gp
         A/NNO/dLyZK17fI2MVyF6vYKA0TulKK2iM8zmQk8CqfTBph5KPSa/NlfLfspc6qzqV4g
         gKOkGd3SIgLs6ZgZZ7fhgur0SvWi5QlSb3tJu1N0raXA/RFZja/ngHDRSdUoaU8uHwkN
         9yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647098; x=1787251898;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EePxyuxj/ORuNvnRcTqvK7WSqyTYRaPWHyS7fmka0Cc=;
        b=hQUZEWB2YnxPDw6BjbK0VWTLySS7e6nt4ZOlG3h4j/BdZsDgtmRDkahHKNqLBS+clB
         uAwNfL+ba/6usRJsVEDylxJdLkpvOy+RIbI9+RDAPFzFQRYTtXVo3a2aIrZHQ8Zon4FB
         zShtevWoUXE4gkBLFAh9nBoHDz+f1jw8IG8SPDqplZvdrB8KObMYntHkt3Q9+OmzqxEY
         AjnybgG0bII/HEjOnQrczXWc/fPROlS1KUcR/I7GHhBwI87SZmK8sqTxnP2xe8n/0RQ7
         e26kSUxqbt/QRF0kWQygh4gmfR314VkHYNVuKVMjJA7v24zebGck91c27Wg1SxSMp/1k
         d8qg==
X-Forwarded-Encrypted: i=1; AHgh+RppATb/q9oS2JKebAKYJ/YS5GYNciXAhSjQFMIGh+VuyXvGVEqirKna0oGSxFiSZBddXbS12MIzShjw@lists.linux.dev
X-Gm-Message-State: AOJu0YwuPL/CpJfXPJZyn/YN10MotLdXWxI9HoRROmLa7OIIaaofS9ki
	e2N9HKgJGxQ3sq1kzg5BUgW7AO/jBBI6Wjn9cBGLjIBA62Gx4IJCwDam3auLMxLhaZVC9H0vKlb
	jg44jnCN0g6/GFbMdOQSyA7wh2GiMMfwV4SUgbV+8
X-Gm-Gg: AR+sD112UjrJ3JK2J5QiF2pcBGfIc+SxwGe3OHwWUGMJUf+fTZr8n3n2qQcteMLPUPG
	f98g6iI/XO+6AoPfzbBcgN+biTRX2oxjnkg0odN50TS5jEq5vp5y2ZUJG4JR9zis/vV6R39fPYx
	D8PlsVUhKH8lrn++Wj5YimruyoGTrXu025tLmn7lUHTyGH1d5iHZ4C8f0/kvuUNvJHf45n8EZ0U
	c+ApNcR5NSkOFRJFZt05X1PhzUwBdCP9RNMJJoplij3yi/X/EAhjNefPpRb/+F98VzRNVdRPDg0
	ELreAOuQAvqWs3tb9tr8Ec5XzZjNPNLthJ5rsRTFLbkEfQF8nF8TuyPYAcyWukDGodVQzS3H5xo
	zPUVOEZQ2R7WGelE47E2iqhbH6hfgBNo=
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id
 98e67ed59e1d1-3931f5f5fffmr4564862a91.18.1786647097635; Thu, 13 Aug 2026
 11:51:37 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:51:36 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:51:36 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-11-2fc18ee6d3ba@google.com>
 <anZ4W9o5pTWIEgMY@yzhao56-desk.sh.intel.com> <anj2bPrGqzZgZWMF@yzhao56-desk.sh.intel.com>
 <CAEvNRgFzRj_=GVy8T4P8ehhQjYomYxkngzwtKBF0iEL0Cv6fuQ@mail.gmail.com>
 <anp1I64K0KeyQuyo@yzhao56-desk.sh.intel.com> <CAEvNRgFWcndQKJE_q+ZATFZEMYd=6uRLygozLvg7L77bPX0cEQ@mail.gmail.com>
 <anqqKH6kuwpvuwp9@yzhao56-desk.sh.intel.com> <CAEvNRgGWDY_fxbyBM-5sMdYMevMe0HzVP9kbC1cCGLE_dV=_Gw@mail.gmail.com>
 <a71d4fccdffd1f6a12332ddd18fa812542ea2118.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:51:36 -0700
X-Gm-Features: AUfX_myWEmd6jjOfyL-08bj4iJ8X-_1fqONSad0Pn1FbAvMHKm6jyQidagK1AHQ
Message-ID: <CAEvNRgHxda6XK_XqWaqqVnA7oW=Fhp_C5gF4vNcL+-HfwfXMqQ@mail.gmail.com>
Subject: Re: [PATCH v10 11/41] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"steven.price@arm.com" <steven.price@arm.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"x86@kernel.org" <x86@kernel.org>, "tabba@google.com" <tabba@google.com>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "forkloop@google.com" <forkloop@google.com>, 
	"Annapurve, Vishal" <vannapurve@google.com>, "willy@infradead.org" <willy@infradead.org>, 
	"tglx@kernel.org" <tglx@kernel.org>, "wyihan@google.com" <wyihan@google.com>, 
	"pratyush@kernel.org" <pratyush@kernel.org>, "aik@amd.com" <aik@amd.com>, 
	"jmattson@google.com" <jmattson@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "rientjes@google.com" <rientjes@google.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "chrisl@kernel.org" <chrisl@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, 
	"tarunsahu@google.com" <tarunsahu@google.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, 
	"baohua@kernel.org" <baohua@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "yuanchu@google.com" <yuanchu@google.com>, 
	"jgg@ziepe.ca" <jgg@ziepe.ca>, "shikemeng@huaweicloud.com" <shikemeng@huaweicloud.com>, 
	"nphamcs@gmail.com" <nphamcs@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shivankg@amd.com" <shivankg@amd.com>, 
	"shuah@kernel.org" <shuah@kernel.org>, "youngjun.park@lge.com" <youngjun.park@lge.com>, 
	"kasong@tencent.com" <kasong@tencent.com>, "pankaj.gupta@amd.com" <pankaj.gupta@amd.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"vbabka@kernel.org" <vbabka@kernel.org>, "weixugc@google.com" <weixugc@google.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "qperret@google.com" <qperret@google.com>, 
	"brauner@kernel.org" <brauner@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, 
	"baoquan.he@linux.dev" <baoquan.he@linux.dev>, "liam@infradead.org" <liam@infradead.org>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "kas@kernel.org" <kas@kernel.org>, 
	"qi.zheng@linux.dev" <qi.zheng@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"seanjc@google.com" <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Tue, 2026-08-11 at 10:35 -0700, Ackerley Tng wrote:
>> > > Would like to see what Sean thinks of this. Either way, is it okay to
>> > > follow up after conversions lands?
>> > Let's see what Sean thinks of this :)
>> > I raised this because the issue was encountered by one TDX's stress
>> > selftest.
>>
>> Which stress selftest is this? I can try running this on my side too.
>
> We have some selftests that are built on the basic TDX selftests. One just
> hammers the MMU stuff with a bunch of zaps and also weird stuff from the guest.
> It was eventually too much work to try to keep the internal enhancements rebased

Would like all the comments we can get on TDX selftests v14 [1]!

> nicely so we actually just run an old branch's TDX selftests against newer
> kernels. So the branch is a bit of a pile, and not really suitable for sharing.
> We plan to clean it and upstream it when the path clears. So it would really
> help to get those basic ones upstream. We remain happy to help, so please let us
> know.

I guess at this point I'm hoping y'all and Sean are okay that this
conversions series merges, and we let this stress test failure be
handled later. I'll be around to fix things :)

I'd say the line of sight to fixing this would be when the KVM MMU only
gets PFNs (and no pages at all) from guest_memfd.

[1] https://lore.kernel.org/all/20260722-tdx-selftests-v14-0-15ad654a50db@google.com/
