Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837786;
	b=1VFTn7REi7B5P4KkOSZBuKcuHHc4R+h9QKXXgMTrXsJyzcf7mWECbUcA77UCFTllGP9Q
	 vinJMUnAorM3ycTyHccEVLMf7cUAfSCPPe3gEvJob4hnqvTFVX+Zsa2HLN5neIJbxNObH
	 opDXrCjkFc4R3DpWLH1mkd9Y51EbuaUFUWTxRRHuNxViuQH3QVSK758ZOGtjr/3pmkOkr
	 0ItEIWrRsotNrIig3ZXitaSHwzfUnHq7zEgdXFtO3otKcBjoSSf2F+UiW58WKjAw+sgox
	 Z2+gCjlnrKz8HrjVXSrK82OvM9k5SZUhmRC8cfE5snBDqpRGtPizTHcJOUtVcyvv4dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8htNjDuwhthg5uXuXp42Sb+r8eU4x+ykq7/WcmWSjZg=;
	b=bm9CJAyFyM8paXfMZ6dIz4w/Q8jtaVjP93sT9VUeFb43IixDsrDLnAoWAuGwQj//TkQu
	 8221cLQAV/pNP83fFjS9Bk8WqEfz5ETKkWwGeL6qNz5LGWAHDXBQo80uigNVsAbD14WDc
	 /1Dn9LD3VjoWSVsfXXTJwatu+iKed1HDswlnBk8+tWQPZdEe2GGrte/CaLhJ1ohpMglWE
	 L5zVzy89asn+2FwmMAOXt0sD1uQOjYPebeF/bAL6bk1tN7Gi8O1KpKlOcDpWwiv4lSzc2
	 /l+FkIfYZ50/qvnOfI8OztoszR8vBfGlzdhdzVGFm0uFzDuAzxw8e5tSEd+cXo62hjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=D2UELt21;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7663D606A33F
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 14:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7663D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=D2UELt21
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67bee1f693bso2886177d50.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 06:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794837784; x=1795442584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8htNjDuwhthg5uXuXp42Sb+r8eU4x+ykq7/WcmWSjZg=;
        b=D2UELt21I5ILCf8AXZAEuvMOfdZHdngeN2nZtUV2REtiuku1ygCCWC6sVC3onou0Br
         oQgvOxRZoTp8D+NGU7iMNdRkGD4GMudxuOM/qxLAN4HNvJCIqEjV8HCQ2tkEVxb8WMIn
         zUVhOr2skKLmaXE2OTvAnaAOV+JYUASTo8JnfRIvZajeR5h5yR1NdJ0hVlJETdKPkeWs
         PnweAQuMZJlxO1Lnh93SDU6l7IMrJvOymCajsQnP3W1vR6mFbkdvoVyTaARMsLcD+qRe
         eXwOcTOOJcfy7OR8PE+10MxMUYK2z1syHo+Xc5Wmz1EjSA3zd2lR40x0KfD/5kCYGCVd
         AxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837784; x=1795442584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8htNjDuwhthg5uXuXp42Sb+r8eU4x+ykq7/WcmWSjZg=;
        b=2iapxSxTjlZq6BO8AX8ZtUeyd+huMBkJhk1gjZGd4v4HVc0HLiL09R2pUIXz1vbkd5
         CeNUzldmfimFh/M1aKD7jVMvM1eS1ZjtNEFkGTuONK8r1V7Sr4ZGm9KYZQNrUAoouNfr
         qSD2eg0mAHhnAskdAOfiS/qOv2hIH9EYwBrARPrrEh/SUMox+TPH1ue92zSsoJ6CFqnt
         5aK5UF2Nj19b700GNRlnlHFS/ZWZvjNQCI7hWvd3kVRIHuXpD4SbKOCIPWqv7pglvRz0
         R8z9+NOCje3vO4mB4K0dQKQixq+N+TEG2lh14fEEmLUoRY0dlmHo4risJz5w/gXQRirL
         6Qow==
X-Forwarded-Encrypted: i=1; AL+hErGjooajqnvGVP7yUWuJG87Of1w/snkY8IUiBLq4l4CPZKjYAHb7TFYb0ubM81ojPeR6DxXM1VCqUeCS@lists.linux.dev
X-Gm-Message-State: APuU4Z8mSUmwmbJGVs0bxd4LNcbzdENMPorjqk7iMN8ipHy3l+gtvw3i
	VjpDrRJsOadOO07xXU1E13/LHqiXBJ38Izzn2ZqDnVOWE0Jq2aGlvQLKTQKrHzaPeg8=
X-Gm-Gg: AZFdTZehiuDNsM39rWpHuYrtMWcjpwfAV6AELCs+QhVrs7et9HBU5rdwO+hcLL0SM+P
	O3gLRapANKMIKEBP0AlWnc3oeuWVS259Ayin3BgfdCSenYW73JyLeWDDRWt5jSSVS85Evsa9M88
	nD8XFfzgOG95wEsfYcnoUkPovEIe6CGzZvc+ISgTcDVryINGquHbbq//h5GZU1qjH9bYBHwrMi4
	+vyVTSKXimFrc56LzUowHMGhfZZyI7yGjilU9eqYoHjHQpRRIfUXmaUMbnH4MOzGlOE7b3wKFR8
	+7xQ4cCA9sF2osP2BdT4bKw1qGrycJ2xO/HRe7QdJbuwzCYvjmP9e+UL5SUnFD8Bx4JzfGOkA3I
	dNd4Rzh8bHAkouS9rj1eeuw9yDBHdnFBUuKy0/xBAzJMfJMy/lQJJwHVl9ZEkfPwFzJxErTRBCj
	CkbNUi1JZzdc+gcDNfYXkS3uoys0u0RothUFQf4aNf6bR9v9+enmhd3+aYzAyDMPOMZogQZPFUg
	SUGaj066weFqkiw+yrNi/MW8hAPioVAwmm9Pw3k3a3rqfdMftFCXJnbieKdqtTCZ8iKVgNxlSJ7
	6quZij5rZOFNXxpa31JVxkiop8M=
X-Received: by 2002:a53:ccc7:0:b0:67b:f935:8639 with SMTP id 956f58d0204a3-67d89787ecdmr4996887d50.63.1794837784278;
        Mon, 16 Nov 2026 06:03:04 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm858426085a.32.2026.11.16.06.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:03:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxIR-00000009Q2N-0sq0;
	Mon, 16 Nov 2026 10:02:59 -0400
Date: Mon, 16 Nov 2026 10:02:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-coco@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Mark Rutland <mark.rutland@arm.com>, Radu Rendec <radu@rendec.net>,
	"T.J. Mercier" <tjmercier@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org, kvmarm@lists.linux.dev, patches@lists.linux.dev,
	Vincent Donnefort <vdonnefort@google.com>
Subject: Re: [PATCH v10 02/13] mm: Zero memory during shared memory
 transitions
Message-ID: <20261116140259.GL2532299@ziepe.ca>
References: <20261116091137.94252-1-aneesh.kumar@kernel.org>
 <20261116091137.94252-3-aneesh.kumar@kernel.org>
 <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
 <yq5ah5hgyj1p.fsf@kernel.org>
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
In-Reply-To: <yq5ah5hgyj1p.fsf@kernel.org>

On Mon, Nov 16, 2026 at 07:28:42PM +0530, Aneesh Kumar K.V wrote:
> Fuad Tabba <fuad.tabba@linux.dev> writes:
> 
> > Hi Aneesh,
> >
> > On Mon, 16 Nov 2026 at 09:12, Aneesh Kumar K.V (Arm)
> > <aneesh.kumar@kernel.org> wrote:
> > [...]
> >> Keep allocations on platforms without memory encryption on the ordinary page
> >> allocator path so the original GFP constraints, including __GFP_ZERO, remain
> >> intact. Remove post-transition memset() calls that are now redundant and
> >> explicitly clear allocations on paths where no transition occurs.
> >>
> >> This intentionally makes every private-to-shared transition destructive;
> >> callers can no longer use set_memory_decrypted() to preserve existing contents.
> >
> > pKVM shares memory in place, and a guest has to be able to share
> > memory it has already set up, as Vincent pointed out [1]. That was one
> > of the primary reasons for in-place conversion in guest_memfd.
> >
> > Cheers,
> > /fuad
> >
> > [1] https://lore.kernel.org/all/avro44jUWOARFzul@google.com/
> 
> 
> Thanks for catching this. We discussed it before, but I reached the
> opposite conclusion:
> 
> https://lore.kernel.org/all/yq5a5wzw2ree.fsf@kernel.org
> 
> My mistake. How do you suggest we handle this? We want to avoid zeroing
> pages multiple times with different CoCo configurations. For example, to
> allocate a zeroed page, we currently do:
> 
> alloc_pages(__GFP_ZERO)
> set_memory_decrypted()
> memset(0, PAGE_SIZE)

Just like you are wrapping set_memory_decrypted() in an allocator API
the user that wants to have the no-change sharing needs its own
special API too.

Then you can bury a special implementation for pkvm there.

Where is this special user in the kernel anyhow?

Jason
