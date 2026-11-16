Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836056;
	b=HMXUbSgBATOaKFbE6ZKs0DRGXKqJPnBmEoXtSTr+Z4lyscC6gHqPkTMkfrIfvVE46Zhz
	 Ji/ujbHQiq6eTYwAVyZT3LUJx+llCmcIBxtivN81j7OCF3//9LIJN9ZqUw72NtecJW1p3
	 BfQIAU1KmwiGSvMHJ194iT9Ug0QiNHUSO1AMiiSRBU/YBpIt9sIknmECzKpOlXEpOsgFh
	 NmTmC0oNsexSaK+mpwz9NStyvDT/1l292DRMtPbiv3dk8g1gm5xrSA/6JZ/O2GoCr6UJ/
	 6sGp5FxH3nka+BIrEmKQaQBorlHE6UJi2Mzf66XOfVWyNcCUfMbgVcgQGgRn6BBat4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836056;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=kFki2hBsnHrC0juVnTO+KTiVDm5TzD8rtd8Do1S8nSI=;
	b=ebV0dRw8DQyXArG42xi+KZMvpqrzA561isTaEZa3rTw0Ppmcaglgu2weCamx2J/HPtJX
	 pTOexEuIDQJyoAus/0gVfwIax4CcC1/2Jdf0wBCP2IPicPHhLmzsNI9WlyZcnEYSdjAqi
	 VE05LWFXZ0QZdxmNTMX2KyvhD+8D0ctaUNOCJjMcSYExFB35HHi1/86BfOmeaGrqzc5DO
	 GU0NBaV1V08m8omO4sbXBiBknyB9zf4FM5lPG5mTbAAKSj9Y3CjUqgHbZVR4Gg0l215a0
	 R+/6KJVTQOZqBCaIKBU3KZKpcU6DlK+4akaVCM12CZ+Rpavf+Ft6xs9Ti2Ablfdkavg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cVjD1IIy;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6782E606A329
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 13:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6782E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cVjD1IIy
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=kFki2hBsnHrC0juVnTO+KTiVDm5TzD8rtd8Do1S8nSI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794836053; v=1; x=1795440853;
 b=cVjD1IIyjvB3aeptttsmfmPZky+MtqINq24PqHtlxmox00kfdTfv5yl2cCXlBxJrPyWSfYea
 Jsr+TaIOrLPOdDhKzwi3ow9GFAoXUpW84HAcfl/KlFLJfFwQA5UcNs340C/oZBVESo8N2UYG5J1
 j9+BGuax2ZJYGWybXbamWdDM=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a1a2d5f3dd575a5f;
	Mon, 16 Nov 2026 13:34:13 +0000
X-Mizu-Trace-ID: a1a2d5f3dd575a5f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so10087e87.0
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 05:34:09 -0800 (PST)
X-Gm-Message-State: APuU4Z//nlRMsBtlr/MWfc7ap4ZNMv2IS2/xiVVrTuOEWCeD8TW2Z9Cw
	Z3Dyuk4utbhYjHAO5/hEVPPxLHLtuqNlX4ysxOtPiq64HpsH3rcAuTuwvf3G19n5GlapgLKvn7M
	YNRUUCBu6C/F/hEOinhf66yfy8ZN4cBlgh3I51c1E
X-Received: by 2002:a05:6512:3087:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5c17d98271emr226475e87.6.1794836047954; Mon, 16 Nov 2026
 05:34:07 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116091137.94252-1-aneesh.kumar@kernel.org> <20261116091137.94252-3-aneesh.kumar@kernel.org>
In-Reply-To: <20261116091137.94252-3-aneesh.kumar@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 13:33:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
X-Gm-Features: AclHuK93q6K13zN84KswjEKi9cVQgC-Cy80dn3a2peCMzM1qEee3TapGEGzaKvg
Message-ID: <CA+EHjTw7QzzkQYKV3jyvW5mqZQMenTfm=kus9i87tYqACDOv0Q@mail.gmail.com>
Subject: Re: [PATCH v10 02/13] mm: Zero memory during shared memory transitions
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>, 
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

Hi Aneesh,

On Mon, 16 Nov 2026 at 09:12, Aneesh Kumar K.V (Arm)
<aneesh.kumar@kernel.org> wrote:
[...]
> Keep allocations on platforms without memory encryption on the ordinary page
> allocator path so the original GFP constraints, including __GFP_ZERO, remain
> intact. Remove post-transition memset() calls that are now redundant and
> explicitly clear allocations on paths where no transition occurs.
>
> This intentionally makes every private-to-shared transition destructive;
> callers can no longer use set_memory_decrypted() to preserve existing contents.

pKVM shares memory in place, and a guest has to be able to share
memory it has already set up, as Vincent pointed out [1]. That was one
of the primary reasons for in-place conversion in guest_memfd.

Cheers,
/fuad

[1] https://lore.kernel.org/all/avro44jUWOARFzul@google.com/
