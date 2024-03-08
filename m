Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D51CA8A
	for <linux-coco@lists.linux.dev>; Fri,  8 Mar 2024 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709938060; cv=none; b=tzWNiV01lKIUp+ljrBPzkgi6rqRTkN0FMfHdq2C9TBBUvOX4Sr+OsKzhmcn/75738E6rtZCEs2ALxIGOhDvbK05sDRdwQ8hf/TIYzjZxAXXVbYLT6MROatmvwGdc9Z8gW65abIF2NXF2TCDmSl0aM5gaj66PeZjVyE56THJg7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709938060; c=relaxed/simple;
	bh=M/bx8q8CM3qETkQji4PtCsuoRWZzooyLQhnGcyOMldU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UYEsDX5n6XQapNPYjOuVLDXYL4NTJ8UKhZ/gLVVqVJtDgHuhNWgzMb7HmM3YNRW4AlUqzovHH0dg67D3vA09d2ojBaP4Nwnx8oc714jU+Hchjx+h+E5yVGaX1QPJzl9TWjibqhQuezrmJoArsD4dNbPDZYghT6TgAXEasRbUI9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dsPfGk6J; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dsPfGk6J"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-609fb719f48so33066277b3.2
        for <linux-coco@lists.linux.dev>; Fri, 08 Mar 2024 14:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709938058; x=1710542858; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKmvQ5PcWXT/71cgvqMhhqx5Wzq7n7WsxYjGNYsq8ec=;
        b=dsPfGk6J7yhzRjyymXSn8iW0rq+a7VXN4Ng/aQwAMyPhERP24AM1q8ykpzBTZjkQ8P
         C0AOjfZ4PFFNoH5b/hV7jrTn9IWKn6GvcxIUF18TcCeraAT+WNyGe0T8r2Y8dYC1TKuO
         yRI7E0XE/IeOL98neuPC/CawFHXHHKpd/50mufxdAcX8p9i49m7/U687fqlgqGX6jk3z
         Np4MMCQ9kS07ceXNOcLnHBLeFcEetx8dgevfTPJVBJVDMp4wjfXSgsBapPczozL+atg1
         P75T4NR3zCjhjXgKPC3qa/wVq0UfRh/R52F6W4huMqHAYSP9SjUwXIXtI4O9f2TbMpV8
         D3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709938058; x=1710542858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKmvQ5PcWXT/71cgvqMhhqx5Wzq7n7WsxYjGNYsq8ec=;
        b=TSV59/gsSEwuU3s55uM1Eq/kaBweiS4/rvBBr45IGJy/KgoUV5RRsQLRqcSlI5eihH
         YdizosboOGg9V8aQ92sff16z9ZZLio6wKzD25oPaNQ5QaguSIZaZ8vqbOwNnItPLKSMH
         czLR/hzxHBT0+oGbvHHRQpfJHe5AzYPr014cIDb5Vtidg7223S/fCT0GLi97crYg09p4
         3lzCLvXTPTXQ8qq8VGJDoRFz1jkcZx2mAsP/ffvm045WJIyteLwqTwh0VZZPSaFXMC9B
         nrfk0bvELKGcs79qxlAQQFd4oKBni8JvYwbeynbA3axLLAeL3mwzL5AyzVcmKAPN+Ynz
         43ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwNGeU8A+BjsBFEa7j+S7rNHmjH+vvQ8CKUbBNokmm+YM1g5ia+kNDzCSV6PuwAreM0kFRolBS6eu9Wp03BI24LkfQu0Tqu+5dEw==
X-Gm-Message-State: AOJu0YzBgnSPkriJ8A7p1dfbuhepGCtTo9iW5RvlIw7eyNFZvsx7QSQK
	WmZ//pzQnKT7Qfavsc9nR8VhdOACJ+XsKBOoGrKgKfqS4aRQhK8CFDKHLnqL6kEXcPc1YAIeSIu
	9rQ==
X-Google-Smtp-Source: AGHT+IFqRwVOtamqH/NKTy0aNd2o9IZB1qaPOD/2a3NruNRdmlhFTn+MhqozJICSJlnbYsW/c2VqgNYGi+8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:5201:0:b0:608:ecf3:ef8 with SMTP id
 g1-20020a815201000000b00608ecf30ef8mr124505ywb.0.1709938058024; Fri, 08 Mar
 2024 14:47:38 -0800 (PST)
Date: Fri, 8 Mar 2024 14:47:36 -0800
In-Reply-To: <aa50a5ea6dbcd5f3f1df39dcf2fc4f5ee881ec8e.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
 <CA+i-1C34VT5oFQL7en1n+MdRrO7AXaAMdNVvjFPxOaTDGXu9Dw@mail.gmail.com>
 <CALzav=fO2hpaErSRHGCJCKTrJKD7b9F5oEg7Ljhb0u1gB=VKwg@mail.gmail.com> <aa50a5ea6dbcd5f3f1df39dcf2fc4f5ee881ec8e.camel@infradead.org>
Message-ID: <ZeuVV3Jo31lcL41H@google.com>
Subject: Re: Unmapping KVM Guest Memory from Host Kernel
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: David Matlack <dmatlack@google.com>, Brendan Jackman <jackmanb@google.com>, 
	James Gowans <jgowans@amazon.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, Patrick Roy <roypat@amazon.co.uk>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, Derek Manwaring <derekmn@amazon.com>, 
	"rppt@kernel.org" <rppt@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Nikita Kalyazin <kalyazin@amazon.co.uk>, "lstoakes@gmail.com" <lstoakes@gmail.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"mst@redhat.com" <mst@redhat.com>, "somlo@cmu.edu" <somlo@cmu.edu>, Alexander Graf <graf@amazon.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 08, 2024, David Woodhouse wrote:
> On Fri, 2024-03-08 at 09:35 -0800, David Matlack wrote:
> > I think what James is looking for (and what we are also interested
> > in), is _eliminating_ the ability to access guest memory from the
> > direct map entirely. And in general, eliminate the ability to access
> > guest memory in as many ways as possible.
> 
> Well, pKVM does that... 

Out-of-tree :-)

I'm not just being snarky; when pKVM lands this functionality upstream, I fully
expect zapping direct map entries to be generic guest_memfd functionality that
would be opt-in, either by the in-kernel technology, e.g. pKVM, or by userspace,
or by some combination of the two, e.g. I can see making it optional to nuke the
direct map when using guest_memfd for TDX guests so that rogue accesses from the
host generate synchronous #PFs instead of latent #MCs.
