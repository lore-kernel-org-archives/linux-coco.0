Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846529;
	b=bQUojNTu7NqwKvhlQovL246Rq4cKvZJJPqSrd08KKKd0KsW/fuHPyqX5Go1UA9cil2Ja
	 HIddDA13vBnrl8tfsUHS5qpZClFlzqfX8TRX2rie8bfNr1MAqn6vacK90W60wbV5zpTgo
	 XLqFNU1tR7SB7sMph4G2xsV5oVn++GBr/y7QG+FGEEVb9dRpSkw8+ug2TyxeJg6PiR/Xo
	 9YWywoDtkXY0jhpPsJ2GSxwMALFGJpossEkw8RUQR6rG0hdltbSntckKaGu/icDIm92u8
	 zQM4Uut7K2fToQoEgFIyczfWG9XiWWWYdRdmBJh/f+QYSVzuMsB4Koc26Wk2mYFEuyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846529;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=eqhrbr8iKieSrVR0UuN7fPro2ug2CEul2vf55oUadPY=;
	b=C2BFqoflGiK6mnbLqCOOakUTPPQzP8FMSsiC/qFfGbhwP3tmeR8X+t2fyu0AkMixzkPs
	 2KzzoC+0Bn3Ems1OKM5rzwTaqRVl7x7ZTTUIKyeFeZeQT0VD8OmtvKutIjOBcOYeRulXu
	 5uXFa/JcZ/6Jpn/zT7V/IqBNr64H/eJnT9VdWPjrRBf9YdHDIfLUyeo+xU7+Sc1MJgb8Q
	 cjw+tofu9AS6nkgcAav9RLu3TCyyp2vfO+Um3SfoYolQzDeZIJZZqADpDmRnwnztYI0Ta
	 9SNtXMOPivEx4LIbvlFhxyYLBu/rhqN6m6rJ3H0hMx3qA/dLmx7ZP5YSU6LNkqy2yHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gzxk0i4o;
	arc=none smtp.remote-ip=91.218.175.194
Received: from mta0.migadu.com (out-194.mta0.migadu.com [91.218.175.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F4606A330
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 16:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gzxk0i4o
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=eqhrbr8iKieSrVR0UuN7fPro2ug2CEul2vf55oUadPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794846527; v=1; x=1795451327;
 b=gzxk0i4o/YJKbfNP79dhIc8ftMTrXLDqZMTb+uvGwlNbkZ300XYZfS2X5crGNPak6K8wzF5+
 UaSYbnNEqKMauQgjSpAEbUthjxT/WlXA5cjcmFPb9+4z3CPVi/C05F6QKek3paTlcWZG74BD5Xr
 HbIwNQdrmYHD4QoR+Nzk9sRg=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b0cb8028361fc542;
	Mon, 16 Nov 2026 16:28:47 +0000
X-Mizu-Trace-ID: b0cb8028361fc542
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be58ad9600so11491e87.0
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 08:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFX6TTZTfx5dMkr3q5jc5LOc/yeWIW1NMsoqvqILHu/Cmv94xMGYQhkO3MZ6vWI7H+V4abJ5hSRtWz/@lists.linux.dev
X-Gm-Message-State: APuU4Z/XAaChIFnWyNE3MLtoWkVYQZUTiN2A+u4SIMN/SIJ1/TEZ6BME
	C3/FAt1UgUR/Yz+wFcwrcw3u+r3D5oXad8i5vc5zLLJk/sooVQ9rvz+0glQWv63Lca6GMo46IQm
	U6iXRbxhCZYrJHZPpJPBaUBIdr4YeWH8ZCY4gBYNw
X-Received: by 2002:a05:6512:1290:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c17d8cd72fmr248826e87.4.1794846521147; Mon, 16 Nov 2026
 08:28:41 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-3-aneesh.kumar@kernel.org> <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
 <yq5ah5hgyj1p.fsf@kernel.org> <20261116140259.GL2532299@ziepe.ca>
In-Reply-To: <20261116140259.GL2532299@ziepe.ca>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:28:04 +0000
X-Gmail-Original-Message-ID: <CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com>
X-Gm-Features: AclHuK8v9DG_RUNyj3rKA0Y0tmAlsYWqFzMKzPZz5wl1VueI09Ml-h3rn0SbMmg
Message-ID: <CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com>
Subject: Re: [PATCH v10 02/13] mm: Zero memory during shared memory transitions
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Radu Rendec <radu@rendec.net>, 
	"T.J. Mercier" <tjmercier@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, 
	iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jason, Aneesh,

On Mon, 16 Nov 2026 14:02:59 +0000, Jason Gunthorpe <jgg@ziepe.ca> wrote:
[...]
> Just like you are wrapping set_memory_decrypted() in an allocator API
> the user that wants to have the no-change sharing needs its own
> special API too.

That works. A separate API can cover no-change sharing when a user
needs it, so I'm fine with set_memory_decrypted() zeroing.

Aneesh, the pKVM hunk does need cache maintenance after the memset(),
which I have in the Cc: stable patch I posted earlier today [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

On Mon, 16 Nov 2026 at 14:03, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 16, 2026 at 07:28:42PM +0530, Aneesh Kumar K.V wrote:
> > Fuad Tabba <fuad.tabba@linux.dev> writes:
> >
> > > Hi Aneesh,
> > >
> > > On Mon, 16 Nov 2026 at 09:12, Aneesh Kumar K.V (Arm)
> > > <aneesh.kumar@kernel.org> wrote:
> > > [...]
> > >> Keep allocations on platforms without memory encryption on the ordinary page
> > >> allocator path so the original GFP constraints, including __GFP_ZERO, remain
> > >> intact. Remove post-transition memset() calls that are now redundant and
> > >> explicitly clear allocations on paths where no transition occurs.
> > >>
> > >> This intentionally makes every private-to-shared transition destructive;
> > >> callers can no longer use set_memory_decrypted() to preserve existing contents.
> > >
> > > pKVM shares memory in place, and a guest has to be able to share
> > > memory it has already set up, as Vincent pointed out [1]. That was one
> > > of the primary reasons for in-place conversion in guest_memfd.
> > >
> > > Cheers,
> > > /fuad
> > >
> > > [1] https://lore.kernel.org/all/avro44jUWOARFzul@google.com/
> >
> >
> > Thanks for catching this. We discussed it before, but I reached the
> > opposite conclusion:
> >
> > https://lore.kernel.org/all/yq5a5wzw2ree.fsf@kernel.org
> >
> > My mistake. How do you suggest we handle this? We want to avoid zeroing
> > pages multiple times with different CoCo configurations. For example, to
> > allocate a zeroed page, we currently do:
> >
> > alloc_pages(__GFP_ZERO)
> > set_memory_decrypted()
> > memset(0, PAGE_SIZE)
>
> Just like you are wrapping set_memory_decrypted() in an allocator API
> the user that wants to have the no-change sharing needs its own
> special API too.
>
> Then you can bury a special implementation for pkvm there.
>
> Where is this special user in the kernel anyhow?
>
> Jason
>
