Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201943;
	b=LnZmUkzXNsTOzjInSyzYTHhf2PFcivc/vTREDOmRmCegdzK4Z3s7tkZ/It0BqLSCEUam
	 UFE4vmXknZB1FvDwR+8uWUSJyAzej2aybZA7HBZwWaFqXTykECeRGF2OHcBLYVvmcKg6f
	 KkgDPzS5MzcwV2QcP+kjKrIrUVh0U6ABwpEIYsHUlm2S6quY7gVPKc/vEsvENuCM/J/xr
	 PLH894+ZuevZBtDDNSIbrzO2HaeHPJzZf2DPB+U/uwCDr7bMNHRr8Xn/RgTxw/61GSsxj
	 hV6ZZcE5SK3bIne+5gF1VHAswKh/UjkSRxeJR9nPKaUmckEfewm9YbDhGdjtvB6T02A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
	b=zWzo9tMAWq2mOyKChTs8DOqzTIX23khZwSBbPhVKHOqjfExOG/yQ5BkZrXn/Uei+i4JG
	 e3JlMMMkENeplhvGZwT+EH04Eqom0G4NWU1x1LB1G4YH4njyCQEk1MKNmZUFO4VOA8Rhd
	 HxmFU5Iy02pHo32C9GL23Mz0quvGQ3f6d32iXIBEmKb5t6kN1MQVgRcvzfWBzpO3hTqiJ
	 yIWW1jRlMx33GogtrqZF5uEAqN2DQw5d5N97XRdYXJDNcMpHBXpB6PIqiX3niPC8f2Gr6
	 O56PcCbURqhRyltbSKEPQnFyJS8lCZ0/y5tNaf3nK4JNbr2IcQCspxbciHyTpJEQzGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mm2UsPy/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED4606A31C
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 15:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63ED4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mm2UsPy/
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c423b145922so156941066b.3
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 08:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201942; cv=none;
        d=google.com; s=arc-20260327;
        b=E2HgWnQ3i8iWXDvqhjy1fT5fsJmIlH2IZZw0hXhVWbArD5TTCv7TX3+yowpwcZuIp/
         c2irbE2dILsgD2xMUBibE74CoDt8VTbM/TO1VsmFlklCzmWYYRKbr73ErOZZHaTcuyqW
         Tji9wE5YWAupNCQPoerYD3UqolXfBNFDNFbYiAtrQ7DAn3Dx1EuUVDqVEyIU/eGtKIbp
         KAPDhFBEiyUy+isJVxnrtuv7DyzJXdF5hrjyWyZbkoGqZspo2Q7kq4o54ucAWJ6M7pr+
         Zlu8kiqG81O0f1OaMidUVYpdtRFfBPRWRNV6jngP/SLo82oz4svlKvJRYnUcZpoPFt4L
         u+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
        fh=hF6idAH9hRVbeKsgpx9je7qcVB96fDrsRhfd+jYxP3E=;
        b=g8jZHffXnlfDQlDtuatq+nlzbz+aGhmbzLPkokJCsadnOCv6+LN2zRsXwIVTX9N+6E
         ukD40rgsQ2jnQ1CBqZRCBxgj0AJoK4Gqm9kyV4WNEVtTFN2FOtGD97d22k0PqpnBkA4O
         Qr8cfQvZ7D0fD1CHTEXaE4DSDzvrpJrdPzMpRcHfKJIiRj2VYfi93JvOaXAvT2zk9Cn4
         6zpP9XJUWgX+HxsjxcN7LrWlR5xRUI1lMs05/ytx5KkhbLT+Z4x4fd5cdN/lLLjHhsW6
         dHLZmpV9Nw2j9Otj7Rsazjkm3bF/UYQW7k+oHtDs3AimdcFwqQXXz8B9KtNfUs2uS0DW
         4Hyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201942; x=1793806742; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
        b=mm2UsPy/mJZlIQL3sSkrRr+szECnLzXTTLxGjgzqwmprXWZk3NV0T5K2RHzBa5m8TW
         6qlUGaHLLpZ5DVcy4lJJ7UNo5eCFd1q0a/SNvtMwdEV9yck6SmEXsrWy2geG2KdX7ukw
         U/yZ+KfKBoHIaS8knH/ky8LN0YI3ORv0CU0dN8Pi1crxM3XexOGjbWderpU1EbHz84eK
         u3pr93D0L3pQ2el/5M9bHbEIAMJmKIu7Ik2+vl3GwveJwdQMPZqHqOSjd26glq9sijRH
         tfu2RhwsJg4ePYsIRxqpGUzvAlEejvSlyKAoIezSDCWv10YiOlyt/b3XbB7/47RsVyyP
         qVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201942; x=1793806742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7xxxnWLJ3cqzVXeSgOYrxm108qFnX6tdnhI16mhQOo=;
        b=Jwf5E6gclhtljTJEuPsuIVAuv/gUjr50PIy4bOMOSMNfj2DRG6ez675+6FB0GxbFGV
         STU0SUVmqp8gYmlMcoo8on3sb6D2xgB/jmreYx3sCqerfFJj/Fop7wg7nqNwVsWGWqWe
         dINKH0kw02n+nV6gduEPKGWrhvk4/asZMtGSClIkhbHRlL7bMY/pTiD/1NUjBtcHkNln
         1ZkaQulG8lw6M42P/KaJLoTZqsOx2Xnkd8PnP5QR08xvsBpAFAN84Wp7bbjgy8JtGV4a
         rgB+O4CVKT2HZeQmzMjjP74AWjUSSokStk5ZiU90fRibzpF5ulMPGDOls8e1TKZeVaoN
         3FYA==
X-Forwarded-Encrypted: i=1; AKwUvBxdhktAOnwidBPPCSHlQkPf1jpBzjAbJzVOIgro6jx8rL+xXPobFyPra8zRP59onlwvJCZIbdvTeb9V@lists.linux.dev
X-Gm-Message-State: AFq9FYID0Ez8xvRyBn/BCyG9H6I9nSHgNahsQm5piXiDUpX/gUmwQQO5
	eTMxdx3B8c8fUx0bpdxylbr7H/vREzTDdG0Gp7Ymf4w1YqyLsZo2xb/Bb3fVYiCRILAW5PpG3Wh
	ZgGc+D73x8+4qOZY6CfMblYQpgEPt75HInXYqFqrP
X-Gm-Gg: AYBFou2023n9kqjxNQZzajfWoEaLxMGyGDXz9Bx09vmWXTKoYFEiqviKc1CzF4wBdYU
	s6qdUzGDoJX5G1oTyEFat8HGpdc2q3z0tWD5jz5w4BIstoYpFzp5kGFipdMDRVyU63PBDGs6mJ/
	l6iMFNpBwuQ9bNcq8Hf7FA3wZPfb4deshGTa+wr0x9KdGS/gYbl3yvFjQtGfiWvhPM1bTd9Zx/v
	p31L8+XPaJ0OfVBpVUcvDEyS04CS6HGlNruO2exsBwH8bzIX/wI5Z6mvuSkqzQOKMjDKveirrIq
	fQqRCnLHmTtXOX+ajc2RJgU4dO5b9wlg8CaXkgL88bZA4hPEyi+SIusi+5zp48My+Y9K9cDXoaP
	hSUh2q+BvAhg8E76FAHL7QsV1cWV75y2rx4vq2J/q7XQ6QugdOrukT3krWHJtW2CikA7nNgTDwx
	mbPQDG+Kgpjbk=
X-Received: by 2002:a17:907:d308:b0:c3f:7ab8:bef1 with SMTP id
 a640c23a62f3a-c49bdf2f80cmr259829766b.34.1793201941132; Wed, 28 Oct 2026
 08:39:01 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027025616.1632690-2-kevinloughlin@google.com> <20261027053843-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261027053843-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 08:38:46 -0700
X-Gm-Features: AclHuK-vBr-9NFy3pcmA7HqGTQSybdCjlTCvxPcN7DJFBT-excWUi_DEsSkfHKE
Message-ID: <CAGdbjmK_vbmxX5Dti9+RwEiWkxQDHz+Dg9ToNnyEd_z-2ncdPQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] virtio_ring: support per-virtqueue DMA mapping ops
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:42=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 27, 2026 at 02:56:04AM +0000, Kevin Loughlin wrote:
> > Allow individual virtqueues to override the device-wide DMA mapping
> > operations via virtqueue_set_map_ops(). When custom per-virtqueue
> > mapping operations are configured, vring_map_one_sg(), vring_unmap_one(=
),
> > vring_mapping_error(), and the DMA sync helpers dispatch through
> > vq->map_ops instead of the parent virtio_device DMA API path.
> >
> > Replace vring_map_single() with vring_map_indirect() and
> > vring_unmap_indirect() using the device-level mapping path (vdev->map
> > or dma_map_page_attrs()) so that indirect descriptor tables continue to
> > be DMA-mapped for host VMM access even when a virtqueue overrides buffe=
r
> > mapping via vq->map_ops.
> >
> > Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
>
> Please, don't. The automatic mappings inside virtio core are there
> to keep simple things, simple.
>
> Everyone doing something funky with mappings should use the premapped API=
.

Thanks for suggesting. I will use the premapped API if I end up sending a v=
2.
