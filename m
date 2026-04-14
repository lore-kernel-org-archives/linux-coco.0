Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B937137266D
	for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 21:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202858; cv=pass; b=LgsjY/ENXZcqniPiNUkfa82ypBirceiVPaaP6mw/NZdMt40/VOT6rz0TjhOrj9oJoQJFB2Iwj4Ka5Xk1bVbKxM6iFykSRY4Hdt5uxRQLZ5/dc4bB2T5twjq4ZUzIk/rk9+7CoMj4CQmKkBPg8I71omNGXb7awG0NSaeqDiSByp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202858; c=relaxed/simple;
	bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b87WAbg0p79DRq08fTMXbVQ1QEhKAsGIiOcKXAuhyqpMFd11tWq7jY84pSfzckYQpBkTWqNCp8NpW2RdZsbtbOywfrIvrTzYBY8VdklykuTDz18pnXSz9ynwyT3Cy6QyxSnbAjnWX/1+wWy4JtRWXra0YJK9ovNw48AUb056AI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jG3UHQyp; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jG3UHQyp"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89fc4147f2eso74139906d6.3
        for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 14:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776202856; cv=none;
        d=google.com; s=arc-20240605;
        b=RArj24AitnOkKgXHtpNJUnmFnQrO8wXJhfG4blb1EahuKnLrDKsE7NN1P7fyyz2bEZ
         W1EwSg9plPvygDjEKxKP/7+QQ7QPYW9X8m3hEnMnmdvafZaHJG0he0IlxF4tlqmeOj7z
         bCXE8zzzICXiM1GkHgOF7fMuCVT33a49YJHOQJbDtYvR3Yf2tSDbQ7geTaJPzquYknaX
         Lh+HSH6kgvz4ZMTNjYDbjVA8tZr+gRQNE5uvrpPTrjJYPtmD5kfYFqTobkqVvSPM+PtT
         r/j3L9s3eEm9FYKMho7Sk7QsqouCC157kfXbhyrNmLQwiqrCJzw/MiRm4B31edmMWcbz
         IuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
        fh=JLAevI9NcOFdzH7Seszk4uO+hzVxBa4pQAsZiOHA5O4=;
        b=QppS9w/KJbhmQw5dbN2PeD7kjeV55Zy8JTjoLH968zdg7zBHmRN6kOXZCuCo9dXN1o
         WuFj2BqUSguu55PK4W2Rz7yKty2Y6N5FHfJNJm0oOyQ1s3eTnvDthMB7EiXLzPU+s5Tm
         cg7KYWvU3HxXD19eE+b9rSqZXOsJdaf3932gPvo6HqcyUmnY52JwTj+pdifJd++A9KnW
         bkRdNxtQbGsChBjQE/wOBA6BABcHlOC9ET+kq4OeKtaTaSPVqOYodSsQqjFZej/a/aBX
         PTruL8anR8ESFWrLB49+QdzKQ87AiY7uCmV+q268DCM085EdYH6ak+YTaIp7rq2dYpdo
         /hxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776202856; x=1776807656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
        b=jG3UHQypZYlKiCjJfKc4gig6/5zMv4494DfuFI2VUqeT9WzqZOTsBSfQJ3RzQncGPv
         SDPKkTVcuh0BdqPjs0ZBGWfnCe7KU8NhVC88i7L8sfFFXcsGj7t6ZLMsZwEIKhEj+iY3
         F+sY1ED+zxyZ2Jt0XvBN2rFmc4glgNoKsL+HCZ+z5ZTvBYQj9GKz0H9rI/5rqOPq6azO
         ae53QJNDr+osrA8Hu7O8piaAWzEjvqgJMeE6o8NhX2f6J60GSnEYD6qGwOs0H/sRsvYS
         vWvRZLbwNDCsLru3pE/ASxzh/O3bOe8UKbJ5lATLAUjZxM64olwuxNr2AYs08mmg5g/y
         zfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202856; x=1776807656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbQceU69YI8zlRogIjlJ0Jefj/2QvndFBDUyO3J/F8k=;
        b=WuRIriO9yBQN/qXZkBZsam31xqtJiaxduA3dpg5hzqmC7AuE/korjk8SS4JXds9CA7
         8bmYNFYuJIpbLKP4vMVoZ00esl+qWmYFpJNJPRftxKNCEtJ1W2ktockH1ryks2bIMm0c
         vgTOSwzqUU2wdgAh2cH5ALRXwQSPwE7FKbj9iozipLqwDNJrMW3DJRGClRwu7OIhQ/K3
         oKupL4hFFsjMcIiPRaQ7qCKuetyYwqA04B8XJry5Ai9ToKclIvZR68mDZihqburHHVVD
         L+j2OoXnJw8Q0R7m5oRaSU1JAbNA9sRmL4nfjJ/XCLKEksckV10rqhTRg5fYyqC/K9CM
         s2tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rCaJ8/JqXlRJS+Us/lYZOF6TYJWvr2TkU4SXv6PtHJNobHQZZUBEgvO19fh4oXIO0or1UomveB49k@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdikq/IEpibADB5bjFwP/A4BXf6Lc44pN9Imev4wASMFyxNkqx
	xt5HdPTC4F4uwLn8dAGbNFIJSEo4fsTr3cX+6al6dwuPnLeT2w11HOFJzTebPXqYeGINcbg6hC9
	TlObuwgLL9I8FVEfI5u0fOrgf92zSgP1h653q5o+T
X-Gm-Gg: AeBDieuo5bbeDm3qcb+5NIv8FKYcTsWyhByIO/ezEoKKtFqY/nk1opLCO4L5U/V441S
	zLNn7ANw8CTlqJbfC9o2CNyS3iTif5tduDCRdBV5vgfxryKsFYT41ILl/8awI4o0rNH2zoW8P1c
	CRDYBBUjbfQPdGVtwBAITrswOnsbFzZ1iODK3zDbZ6fERmMtHe/kWdw7rRMO6+DLk8/wUG8EkpT
	a8sjt+FRuOltk9uU0LRS69YfYuM9NDVWlDZndybc4UYbMeRwLb0YfDNAELHRNp8SWzqY2FoB8OL
	izAAHjUuYecZ8Yty/xKnP5Tb+cU=
X-Received: by 2002:a05:6214:c21:b0:8ac:7e8d:859b with SMTP id
 6a1803df08f44-8ac861b77f6mr303189226d6.16.1776202855012; Tue, 14 Apr 2026
 14:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318155413.793430-1-steven.price@arm.com>
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 14 Apr 2026 14:40:43 -0700
X-Gm-Features: AQROBzAobYGs6qZALJkhuUvP32YWYfFdjJZKqlEWIdyyyT7N50O82BunKYW5J_Y
Message-ID: <CABpDEukEO4Y_fg8fv5Nr1_Pw_qOK=2UmioXk=WyPEzoEprPcGA@mail.gmail.com>
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 8:54=E2=80=AFAM Steven Price <steven.price@arm.com>=
 wrote:
>
> This series adds support for running protected VMs using KVM under the
> Arm Confidential Compute Architecture (CCA).
>
> New major version number! This now targets RMM v2.0-bet0[1]. And unlike
> for Linux this represents a significant change.
>
> RMM v2.0 brings with it the ability to configure the RMM to have the
> same page size as the host (so no more RMM_PAGE_SIZE and dealing with
> granules being different from host pages). It also introduces range
> based APIs for many operations which should be more efficient and
> simplifies the code in places.
>
> The handling of the GIC has changed, so the system registers are used to
> pass the GIC state rather than memory. This means fewer changes to the
> KVM code as it looks much like a normal VM in this respect.
>
> And of course the new uAPI introduced in the previous v12 posting is
> retained so that also remains simplified compared to earlier postings.
>
> The RMM support for v2.0 is still early and so this series includes a
> few hacks to ease the integration. Of note are that there are some RMM
> v1.0 SMCs added to paper over areas where the RMM implementation isn't
> quite ready for v2.0, and "SROs" (see below) are deferred to the final
> patch in the series.
>
> The PMU in RMM v2.0 requires more handling on the RMM-side (and
> therefore simplifies the implementation on Linux), but this isn't quite
> ready yet. The Linux side is implemented (but untested).
>
> PSCI still requires the VMM to provide the "target" REC for operations
> that affect another vCPU. This is likely to change in a future version
> of the specification. There's also a desire to force PSCI to be handled
> in the VMM for realm guests - this isn't implemented yet as I'm waiting
> for the dust to settle on the RMM interface first.
>
> Stateful RMI Operations
> -----------------------
>
> The RMM v2.0 spec brings a new concept of Stateful RMI Operations (SROs)
> which allow the RMM to complete an operation over several SMC calls and
> requesting/returning memory to the host. This has the benefit of
> allowing interrupts to be handled in the middle of an operation (by
> returning to the host to handle the interrupt without completing the
> operation) and enables the RMM to dynamically allocate memory for
> internal tracking purposes. One example of this is RMI_REC_CREATE no
> longer needs "auxiliary granules" provided upfront but can request the
> memory needed during the RMI_REC_CREATE operation.
>
> There are a fairly large number of operations that are defined as SROs
> in the specification, but current both Linux and RMM only have support
> for RMI_REC_CREATE and RMI_REC_DESTROY. There a number of TODOs/FIXMEs
> in the code where support is missing.
>
> Given the early stage support for this, the SRO handling is all confined
> to the final patch. This patch can be dropped to return to a pre-SRO
> state (albeit a mixture of RMM v1.0 and v2.0 APIs) for testing purposes.
>
> A future posting will reorder the series to move the generic SRO support
> to an early patch and will implement the proper support for this in all
> RMI SMCs.
>
> One aspect of SROs which is not yet well captured is that in some
> circumstances the Linux kernel will need to call an SRO call in a
> context where memory allocation is restricted (e.g. because a spinlock
> is held). In this case the intention is that the SRO will be cancelled,
> the spinlock dropped so the memory allocation can be completed, and then
> the SRO restarted (obviously after rechecking the state that the
> spinlock was protecting). For this reason the code stores the memory
> allocations within a struct rmi_sro_state object - see the final patch
> for more details.
>
> This series is based on v7.0-rc1. It is also available as a git
> repository:
>
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
>
>

Hi Steven,

I have a question regarding host kexec and kdump scenarios, and
whether there is any plan to make them work in this initial series.

Intel TDX and AMD SEV-SNP both have a firmware shutdown command that
is invoked during the kexec or panic code paths to safely bypass
hardware memory protections and boot into the new kernel. As far as
I know, there is no similar global teardown command available for
the RMM.

What is the roadmap for supporting both general kexec and
more specifically kdump (panic) scenarios with CCA?

Thanks,
Alper
