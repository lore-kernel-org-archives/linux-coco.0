Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B543D413A
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070798; cv=pass; b=IXjQiNNH7gzEw5eTVmUm/gdNoj3cy2ooFJz80mUyKd+zhZ5j34R4BhvSzUP4PpAD8UpWdpJ/VDfn4IjR8rJVvUK9HemlcouxTKLQRntiF6fvPtMzWEGkNpBpx0BHKZ98Avn6RKt0+UgRUchtKNXYragT+DsBRMbiWLxZSD/7CYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070798; c=relaxed/simple;
	bh=fUiMYtNMvHNYULJIwkoZwWkLFEOGGVApxwthvUYiwWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQG1Sz53o0PhXkjFD8JwOiYiuYbjl9IXsU5HDMmj1kpucwU3txXnismoN3C80zfU4xGEaLd8t+26ToJD57SKw0xTSebm3z5gSE2TU+0elc6peN83U8r+eoLvaf+/iEoMEXMyhgpdrovXmxf+BovEjDEUxJ4iWb6kXTQ9b/79M50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kJRjhJ5Y; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kJRjhJ5Y"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so11484279d50.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 08:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070796; cv=none;
        d=google.com; s=arc-20240605;
        b=ViL6NIckTXCb4d3yWhUszalPSgses4xZlQ+7syvrT41lPXJcFwZ4TXgc0XvWGYjmbh
         6u4JGyR8RwPwm5FN3AMN6GsDg5FCntjAIrra+NJ8cVECawkLieUGym1IWItDXzKiBkE9
         WpFE6HitVpKEeHHsMX+gRNq4ZXhIc/mVjXysd10TH7PBz33fQtce/EkVrUqHq+qJyXII
         hvWjxqI+IYWQTk1vu0UAxRzH6yK1pjKfXSGKRD6XfUiUGf1AwiQQfORx4HphmcESXUH+
         /85Ky7uIjWtC1OmiyZk9X3mBJj8/hEWDZvJIwHOVvf6f9olIlXc/I+EcoPfI7ae5wC19
         s+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
        fh=xdhivR0ag1WsbFI+PONZ7wznjweLJ8lO9hgwrguIkn8=;
        b=H8k6WpqGt3i6AcraZtXfKw0J8F3vi+JIm+1TvpHuE8sK8ZsAVd6dpX7qkZx/ODJMlQ
         oUURvuPCc27762roZyewuEBoJJTgI9uhBDQ6ikXs3a9xTJRhyyceD080mSk6HTV+sLwp
         ksnCYJcIh9M7Ay1CsTZ39gpObxVmsVttHdHby0PshS/ZHOBAwSSBgZK4Zr8QMhRPQo9v
         XgUHthRh4uicMDUfX+7fenhYJFeiJtuoXh2mhV8zCwD8+3Ufpi9kjpUF6YlfkOtzjRQG
         3t8zb3PzwJcIbGv9JDV3u7ndwbNDiA53Ok4ALDlEHok3ddp3RClCrUvyicXU2VOMCcQA
         lLLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773070796; x=1773675596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
        b=kJRjhJ5Y3bDhtQO0zfrZWT6BXzLPrV8i3Swq+0RMpfb/7+qJvC3Rxyp6CYU5Zk4Wqw
         K6/qxcYrqGRE7AYHj8hGvJ7F53C63lDTokW+lY1HDO3gLNuX1VK9PeyEii4lPItkhFKp
         37KsDI51oyNURR/aYeTW9I/vMoKpQ4sGaDFkFqlJ1AWpgo6VqEx2fNTS84A5r7CbXIqw
         4y1gSbu8q57U7sYbqHOW18jzHHRtErupJxydRCIxVx+h+TpNgmge9MNhU2GTPXU0P76S
         86dHbzTtjFV4bIfIG7HD/caL9LeE/1T9kgQz5d0FfVUPed5Yxw9ujRkZ1CjY2vocY7ul
         cAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070796; x=1773675596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
        b=FL1gmi0fG8bkAJt27cZiAuGU7PPNf9aA/rqEBe1K3LoNC0o3S3mSX1x7XAhDZSOp3i
         /0cKDAAYUAUFsGZ0u1O6pxOWUAXza0u/F6p+4TA0WQgkV55RUUQFNjaiDjSHZ2SQnD0j
         3ekSpw8DFkC4/QkcYA+VBsZiCcIbWFeIQgMuYwjjwikV6MBZdWOPjbdS8e2qNsI0/mTF
         1bwTw0NT4YOnV2jT9CBg7mtHRpT31wcYFZEoJmxcyEQl4555a2zjPHGKDKTJpjZiqBtu
         MRfv8FzDIN5G46uyWOsRDgZJeyPuF/XHoTAvi5wZ2VEUSwTanEyCn/h/7Q40N/hwsH88
         USGA==
X-Forwarded-Encrypted: i=1; AJvYcCXEU57SyyFGQXUR1+jKjB7s2EKJ6LshdKt8effTJAE4Jil3+XCdwtprhaKv0Bygz0hwJ6iBvLxuregE@lists.linux.dev
X-Gm-Message-State: AOJu0YywIj7fZ4Grjy5Z0K0DBph/HTy2YfS0iPKnneOySqXXSy5Tpb8X
	ph2OPK+zLd2OMtG/4hgzpoimUMDjsOs7vW7wU3gnfntkB6arN3u+XeFwpPBVD42dXHzh9XQ7Fak
	9Nbka/zSYIeIUL7KsAAjID74PHwcx9vEZUuBoFwAj
X-Gm-Gg: ATEYQzwcbyN7Uu0JCiRpWItfEygECzlUj00gylIxF8tF0C7Zd89HKNKNIARdit+82N3
	LD9tWle/p3PbTTuN3ri0vAIOhA0RZLqWsf9UpkO04UvKvfpyRiADH0n2edoD6vACIdMZsF/Im5k
	BnuIj5QiUtCG9FGjBGOd789d5z7BwwWu2hQ26HttRcGmwWKpUiBjncOumgsKjEXm1sZ8uG4qpZ7
	tAqfWvB+rySwGt7svEV2kibHuvRqttF5225XgPgkcYahUNJ4eWchMJ+vW56H2/BhLzkaG9wZy5g
	gaC0xrSQWRPilPhlB3qf1suFga985T/Qh3DshB1fA2Qj6eXl
X-Received: by 2002:a05:690e:16cc:b0:64d:29c6:7974 with SMTP id
 956f58d0204a3-64d29c67a27mr3174372d50.11.1773070795335; Mon, 09 Mar 2026
 08:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <20260305123641.164164-3-jiri@resnulli.us>
In-Reply-To: <20260305123641.164164-3-jiri@resnulli.us>
From: Peter Gonda <pgonda@google.com>
Date: Mon, 9 Mar 2026 09:39:44 -0600
X-Gm-Features: AaiRm51h3c_DzKOKsC7CokIZvNyOKydjIyhi9bVIzEGXBlmxcqpV-AFuGedzucs
Message-ID: <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] dma-buf: heaps: system: add
 system_cc_decrypted heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great feature to have thanks Jiri! A couple naive questions.

On Thu, Mar 5, 2026 at 5:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> allocate decrypted (shared) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is encrypted or
> decrypted. The kernel's direct map is set up with encryption enabled,
> so pages returned by alloc_pages() are encrypted in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to encrypted memory (no TDISP support), it has to be explicitly
> decrypted. A couple of things are needed to properly handle
> decrypted memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent decrypted memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the decrypted pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.

So this only works on new mappings? What if there are existing
mappings to the memory that will be converted to shared?

It's also slightly worse than just reading ciphertext. If another
process writes to the memory with the incorrect mapping it could cause
corruption on AMD SEV, or an RMP violation on AMD SEV-SNP. Can we
update the existing mappings?
