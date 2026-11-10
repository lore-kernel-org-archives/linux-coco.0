Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316282;
	b=QBMYEhNKYGQb79VHP62JpLQVo022ng6JlrF2JaJBxxNR9XAZSSuFLrboITomFbt2a5P7
	 XbIlGDMnK8CrrNkZ1ix3QV6LXGqQRVchd15Jbg3kfkplxqI1eBbKasu2euKi2lbjzceWQ
	 K0Uw3nH+jT+tI/egJ66K7tgkRAHCGzv4uQqzvttvN/81nheI/iz4trKFpUskHkHci9gty
	 q3i94eUdkALEohgFfs+GtlUHoM2IDjtlswAklv4uPjy44EIHWIAyR6NGt2lvId5f9iOm0
	 01xB9+2pDoNPivbsBHHBy0ZNpCKnQNHAPGaUZCnMYimBgOnDzCCBunrp11DGZfLfnWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hv46jG8uHZHn78TEQV5LM7K76EVF6QARAJT1M8iUKJw=;
	b=JwWY9KM6732iytL7KZa1ki6ZaxtxQCvvromCNY0Qa56rYqCekxd7wQ83Njzv7p0NThmB
	 OMQw/EpH0cY4MLUwGXT5teHF0RvwY8XiYirQmV/ylVlFvCmsR+QkXh0GJVbLC1Vu2/SDJ
	 xAmcrxeehs8w0AHit9ju3Do/Jc88rZ0RE8RlWSjgulvGYUVl7e2+1LOAfTNprbHEk3S0c
	 JIUNB8YMurN4LaGfEWIPWn5qHN0NcYfkilY73NZzkM6wcUELo9/WSSuqjGKVzZQU7XoFH
	 TVh4bW4B46Dtn29/RTr0HNPkiTmsIstyRsAIHX9uuBQ8jh9zyoSHI4ZdgikLveIUEGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RnfRVgrN;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17731606A77B
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 13:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17731606A77B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RnfRVgrN
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91eb3ac1875so19660906d6.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794316276; x=1794921076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hv46jG8uHZHn78TEQV5LM7K76EVF6QARAJT1M8iUKJw=;
        b=RnfRVgrNOm4GLGM3WVgPK3NWrQBiHrGraqPtGwMDNHSUwQvYwn5PvNxWWoa6/AoRo+
         bfTuykYo2IcvBo74NnWS7WCXpdn+JA5W1K9EjvdgXua41bEQVSy4oUKJy+S1C+KaznmB
         /hThcg6gYjZ+arsC1LFJJazBZeTj1iE2yfN3F/A6Z+jI7uF0qFfYUCAy+Og4GaTnxUDq
         2noFWZLKmzvPdHAs2FDZr5Y5Qj8T3f1eYvpzsUVVAQNpEjbw5HIlBT0LGN5Wx42QxM1q
         8ly2PSpcWdg+c12U0KD8GqTNuLhgY7XHU4ikEpGxmW/0A0qUq6BUrbB5a0ZAHDbDyYeE
         Zrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316276; x=1794921076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hv46jG8uHZHn78TEQV5LM7K76EVF6QARAJT1M8iUKJw=;
        b=aNRj76WoegyHa0I6px8TJ+qqxm7lnn/u8COpy0FVFiefMbXG6HyfY8zWap5dBjAjxH
         ssTCrQd6wngxcvK/7GSGo6q5TmTHfvkQBCgQ7Ry28JaqHgBf5mFwkMqvJ2iRBMhzMUIE
         0bTzMAhAblqz3zwGZg8y9lpNLnhYjhrmVbKqtGzC8KYNldCWQxzN11ZoZ5CkwcZpOXBr
         dL1cBJmiC3wAy1ZiiMBGYWWS6mpCW0FyIvGjZ26LUCTU/2ZqohT1y0gucqVMic9ktZH4
         xwHn3CHE5WHXoTXGCqTzfrgSMdy/tESqNJoqjU61+y4Z4vmO/EoEgTn6cXh3nlpyLyZw
         leUA==
X-Forwarded-Encrypted: i=1; AL+hErGcLq6Ey9r8yqzWHMjBMA9QB08eFU5YY5d6tIxvvgsbxKbfYM38sijTzIiy+aVWMGOo5u5qQfuZuQcN@lists.linux.dev
X-Gm-Message-State: APuU4Z8wmo8bHIuh0K5OEhZAqlNq49HhiMby0HmBx89GyoAIlXXLrpj/
	JtV/UvdKB5bZ75x4ScaOwKdTYtDmJBaHj+tBvMwAcSElfpvGytmlx+DAzPZg87eOBw0=
X-Gm-Gg: AYBFou3+ggIfVFd/oAt2+gGcCJGmxUx2SimkJa3ojH8hY+K31+7J/GmA/VwSP2ADZT6
	3Xfw7fEPjelJZCv16Jqgc9Wt7e2E9ttD0x9Hl5M5FKqZJYYmxa+SfhfsZm8WVX/gm2vuK40UfBe
	0gZsjQ+Xr9aKmSXi9ioIREO11pf19GI7wJibEo3yO4TkzK7S/cA0AYxY/hVXtxfJfr+TVPFidFi
	WrH/LPI9TlD9zNxMGhCOJxHMZSxxu0upzSzGLbKgVV468io5VYzWKk0qDhMnNijw3fMMO9sTJF4
	Z1zIA+oLQPW5tDsBXV9kS9Kcl4XwXG4Ur+qRkSmtaZ6BtSBfSUbcTvWXhc8aXPSznSWlV9XGOLV
	8q+hVEmx5XPDahoI99BM1cipzJS/w3CPeZ/fwKdZwMsdjD8PHvjmBCxQ88SwJ+aqbd41egYGiM5
	1upxfbU/ME/F6UWzbvgXbHDPF0MNF4Fx5sC6xHZ3kQM1KQQVYRlD81OFFfJRU8OwrQ84FG76/JB
	ZI8U5k51sbRM2JxpZAw9W7IW4p8q53gk82EhjQa62HVBnDzTiPF0B02VdWvWVm2U6InEtZ76dxK
	mTVberU0tlJpld+Z5AW4ReF2z2hfX2cj/QVGnLLaY+GJCa5+uEq1D5jC+n76n1NxHL/XBCiROdU
	P4zmVAdiAnvg=
X-Received: by 2002:ad4:5cc4:0:b0:91e:96f8:f369 with SMTP id 6a1803df08f44-91eef913f53mr42602176d6.36.1794316275746;
        Tue, 10 Nov 2026 05:11:15 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef052360asm20821916d6.38.2026.11.10.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:11:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQld4-00000005faP-2KGJ;
	Tue, 10 Nov 2026 09:11:14 -0400
Date: Tue, 10 Nov 2026 09:11:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"aik@amd.com" <aik@amd.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"Fang, Peter" <peter.fang@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"qinkun@google.com" <qinkun@google.com>,
	"pgonda@google.com" <pgonda@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261110131114.GV663069@ziepe.ca>
References: <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
 <20261109171236.GP663069@ziepe.ca>
 <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>
 <20261109234252.GR663069@ziepe.ca>
 <4c75b369b68c98c5c35e296895b6935342dc7dc1.camel@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c75b369b68c98c5c35e296895b6935342dc7dc1.camel@intel.com>

On Tue, Nov 10, 2026 at 01:30:16AM +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-11-09 at 19:42 -0400, Jason Gunthorpe wrote:
> > > So we have this SGX based quote format that is fixed because it already
> > > exists
> > > in the wild. Going forward we are moving to DICE, but that is a standard
> > > format.
> > > So also somewhat fixed. I guess the question is: is there some combo of bits
> > > in
> > > each blob we could check that could deterministically distinguish between
> > > the
> > > two? To do this we would need to analyze the quote formats.
> > 
> > You guys really didn't make it discoverable when you added DICE? :( :(
> 
> Like influence the DICE spec to interop with legacy SGX based attestation? I'm
> out of my depth to try to say how possible that is.

No, I mean just have the SGX firmware tell the OS if it produced a
DICE or legacy blob :(

> I'm also under the impression that the quote was not designed for local
> processing in the guest. But rather remote attestation which, usually involves a
> helper service that processes the quote. I've never been clear on why that was
> desired. But it probably is part of the reason attestation doesn't fit this use
> case perfectly.

Even the remote helper needs to tell the two cases apart so it can
parse them

Again if you expected the user to pre-tell the helper that this is a
legacy vs DICE VM then that's exactly the bad user experiance I want
to avoid.

> > > If there isn't, I'm not sure what we could do at this point. There is a
> > > library
> > > Intel publishes (right Peter?) that can verify the quotes. I'd guess it must
> > > have some way to distinguish between the two. Can you check how it does it
> > > Peter?
> > 
> > See this is exactly what I'm talking about, I don't want to repeatedly
> > get into this situation down the road over the next decade.
> 
> I'm not sure if I'm missing something. New incompatible standards seem pretty
> normal? Sometimes there is a container to specify which type of blob, and
> sometimes it is just discoverable by clues in the bits.

Yes, completely normal. The thing that generates the data should have
an unambiguous contract with the OS on what kind of data it will
generate.

If you want to change it, thats fine, but the OS participates in the
change and is aware of it.

> I think the thing that is a bit dicey (no pun) with this, is that there is kind
> of a backwards compatibility adjacent change for systems giving the new DICE
> quotes. This came up in in both discussions with Dave/x86 and Sean/KVM. The
> reason why it was considered grumble-ok in the end, was because the full
> verification depends on updates to the library for each new platform due to
> needing to be aware of new keys. So to actually attest even SGX quotes on a new
> platform, library updates are needed to whatever tool or service is being used.
> Since the library needs to be updated in any case, it can also understand the
> new formats without any impact to the user.

I don't know what you guys have done here. There are IETF standards
for all of this and well defined container formats. Sure to parse
every bit of the token you might need a new library, but you should at
least be able to get a signature verified and parse the generic
information reliably.

If your plan is TDX releases are ABI incompatible with the verifiers,
then thats a horrible plan and *much* worse than what ARM is doing,
for instance.

But it sounds like your library can somehow parse the blob and figure
it out, so maybe it is just a matter of describing how that works.

> But this didn't take into account this generic API, local quote processing use
> case. Which is kind of a surprise and I'm actually still not 100% clear on how
> it will be used.

It is not local quote processing. This is labeling data properly so a
verifier is possible without the user having to manually and directly
inform the system what versions of Intel CPUs and TDX modules it
should expect to have.

> I think we would have to circle back with everyone that pushed for the host
> controlled quote type. Let's see if the library can distinguish them already
> too. This attestctl tool... is that something that could consume a library like
> this? Or something that would have a no dependency implementation?

I would hope for no dependency, the idea would be to provide
references for anyone wanting to make verifier software, and a tool
for the admin that wants to debug/understand their systems..

As well as a point to have a strict injection of sanity into what
people are doing so we don't get repeated ABI breaking instances in
future.

Jason
