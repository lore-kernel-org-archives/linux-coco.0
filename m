Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB04C4A990
	for <linux-coco@lists.linux.dev>; Mon, 18 Mar 2024 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710771100; cv=none; b=IrnH9PKe41kUm7un2vCySSNvq6g8dZ1ITUwJnN9nAwcYq75mpZ0bmYXHY8gO9YI8ZN9pnmOGpGLuUXbZijTnme+n0LZmxJQtJOtra70AZb8QMdr2dF/dtfXh1htRC2cYCsqPPMB+moqwRMBT79cRnGMLTBSJHsnlhLaUbRzcl/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710771100; c=relaxed/simple;
	bh=oym0AIJ+THr0KYNh2rLzj1Zqh/rdOPJlqoAFEVOa+1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiqUT8q+pyLzgXTxmSlQOTPhl/kkW+jJuqLe7Wr6FW8/BykPX8PF7LXeHOxCgQ+OCpQIvuS2UvWvK65XeyuUK+TOWCjJ53Hvay14hywdvtR+zJ6ah0a3As+3E9kQd0fsWz0s5gX2ctcWaNHktzbS+Dblm5N5JCTUUr2D46mnK9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C9UEywBU; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C9UEywBU"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-428405a0205so484301cf.1
        for <linux-coco@lists.linux.dev>; Mon, 18 Mar 2024 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710771098; x=1711375898; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rU3zFykgVuweueIsoxzQMtKYDDN5Bjw0bqJ5bY+qA6E=;
        b=C9UEywBUuIx8Te2j2G+F5Z7GeuC6XSYaZ8f/U+VlQh2MPtrdbismCYnuaol3D7NSj3
         jWJyg4sGhlZcHco+aYy3spLEXaOtgu49WOa8iE2rGtBjFbYAIIggKXVg8+NiAR0o0MFT
         CM4wOnffoOZy4qS67e12cHtBymSfJxU1BXxPELyT0r1631VE1Ed7lN9Y3gFilgOi5HE2
         RSkEjI8mF2wvvL1dCO7qsDteR/SjcC+GjZ51QdGU+EZZh1rAAImTgpHPq8U7pkkr7FiU
         718fOX/Bn7ecL5Hex5Y6ESEQfZrRHA5IDntlS2jTWEEUre/+B50uWbeSjRvVWz2TkfpX
         9oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710771098; x=1711375898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU3zFykgVuweueIsoxzQMtKYDDN5Bjw0bqJ5bY+qA6E=;
        b=abEV5lFf0cLrW7GHhU5z9EsvXbfEosdbNMs1Z0R7GROE0ABnanv8iX/AtekrHG/63a
         8vagkmbvbK6wkTHE4Me5z/IaP01MUgNI+WGbeJd+2eGY9PxgnYfh5WOpvPyNyLP4ypOs
         cHMhyLTPi8wzkKAF9CnYgibEbsSNgmD3U/pUmFMVLT2kRq6Tz8etoN1nVejUXXLEOgAN
         FIJqCCOsFk7gvXrhC0QX0byHCE5whONHrhGyFzKEqQKaUStWZkQYfqWEAT0zprOtLJRi
         CbpRl0FiaTeq49SToQBv0VWhlog3p/xVZedwj0QvTJVVrNqGhA6066S1T2KmbjLycC/R
         cB8A==
X-Forwarded-Encrypted: i=1; AJvYcCV8fL7i8y8doKj2EP1KPjYCfCcp2OELsqCN+uhG30idaSz4n6NZrFfxZcKaRO+theOCr7MX/25BUlMo3cKLaExBS1jIWoB2ftEyjg==
X-Gm-Message-State: AOJu0YwAcuQqTGkf0a1gHNA7htG27IoedRDFpCBzRKsA2SpvUCpnf0JI
	jkI7X1qhISdX2B7W+AIDYyBIrfn/w489zc0Iz05psPeMwyWIzQRMBYON/ircvZ33d/bfJq5vmMf
	5uUY4+yuixWdNMKxxLGjGv7tUbHN0RqYWQiq5
X-Google-Smtp-Source: AGHT+IEP1eDBtV9wwG22o9FLtfUkcC57ZS5hhvLcQHaosamz9mFsDACdCEemZgZ1KW9i0+WwUAZxZDxm/IPXpyAyIxs=
X-Received: by 2002:ac8:57cd:0:b0:430:9ee1:a8 with SMTP id w13-20020ac857cd000000b004309ee100a8mr330194qta.3.1710771097539;
 Mon, 18 Mar 2024 07:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cc1bb8e9bc3e1ab637700a4d3defeec95b55060a.camel@amazon.com>
 <CA+i-1C34VT5oFQL7en1n+MdRrO7AXaAMdNVvjFPxOaTDGXu9Dw@mail.gmail.com>
 <CALzav=fO2hpaErSRHGCJCKTrJKD7b9F5oEg7Ljhb0u1gB=VKwg@mail.gmail.com> <8e3c2b45-356d-4ca9-bebc-012505235142@amazon.com>
In-Reply-To: <8e3c2b45-356d-4ca9-bebc-012505235142@amazon.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 18 Mar 2024 15:11:25 +0100
Message-ID: <CA+i-1C3DtXzzkatepVvn-E45Gyxb3YmYd-irxfjDL5bL5MhWVA@mail.gmail.com>
Subject: Re: Unmapping KVM Guest Memory from Host Kernel
To: "Manwaring, Derek" <derekmn@amazon.com>
Cc: David Matlack <dmatlack@google.com>, "Gowans, James" <jgowans@amazon.com>, 
	"seanjc@google.com" <seanjc@google.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Roy, Patrick" <roypat@amazon.co.uk>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, 
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "lstoakes@gmail.com" <lstoakes@gmail.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"mst@redhat.com" <mst@redhat.com>, "somlo@cmu.edu" <somlo@cmu.edu>, "Graf (AWS), Alexander" <graf@amazon.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, kvmarm@lists.linux.dev, tabba@google.com, 
	qperret@google.com, jason.cj.chen@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Mar 2024 at 18:36, David Matlack <dmatlack@google.com> wrote:
> I'm not sure if ASI provides a solution to the problem James is trying
> to solve. ASI creates a separate "restricted" address spaces where, yes,
> guest memory can be not mapped. But any access to guest memory is
>  still allowed. An access will trigger a page fault, the kernel will
> switch to the "full" kernel address space (flushing hardware buffers
> along the way to prevent speculation), and then proceed. i.e. ASI
> doesn't not prevent accessing guest memory through the
> direct map, it just prevents speculation of guest memory through the
> direct map.

Yes, there's also a sense in which ASI is a "smaller hammer" in that
it _only_ protects against hardware-bug exploits.

>  it just prevents speculation of guest memory through the
> direct map.

(Although, this is not _all_ it does, because when returning to the
restricted address space, i.e. right before VM Enter, we have an
opportunity to flush _data buffers_ too. So ASI also mitigates
Meltdown-style attacks, e.g. L1TF, where the speculation-related stuff
all happens on the attacker side)

On Sat, 9 Mar 2024 at 03:46, Manwaring, Derek <derekmn@amazon.com> wrote:
> Brendan,
> I will look into the general ASI approach, thank you. Did you consider
> memfd_secret or a guest_memfd-based approach for Userspace-ASI?

I might be misunderstanding you here: I guess you mean using
memfd_secret as a way for userspace to communicate about which parts
of userspace memory are "secret"?

If I didn't misunderstand: we have not looked into this so far because
we actually just consider _all_ userspace/guest memory to be "secret"
from the perspective of other processes/guests.

> Based on
> Sean's earlier reply to James it sounds like the vision of guest_memfd
> aligns with ASI's goals.

But yes, the more general point seems to make sense, I think I need to
research this topic some more, thanks!
