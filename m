Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188C4A7CB6
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583029; cv=pass; b=uqtoxtvD6BylnPqEUvjeTXO5wBe34+DwQbHmJS/RtU4Cb+mZYB3xPLwNhDf4+W+jQ/IF/PPRJYioLR72BsEO4g7a8ZA3N+8+14FmVTRfGH8j3np+Wq5cwb2UP5OHWmdSSjbRXsZMmF9j/ayuKUNmlXnLx/VlQIa+ZZgXJ6ZSvIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583029; c=relaxed/simple;
	bh=K1VkZN9Ax/ivqRQhY6l3VgzDLSp6+7t77YixSnLTILA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3Fn8IGZciJ2rewYL2gElYY1UAuGEmPaubeRIYiwwAr8Jbkh18fJ/plSzkX+LAKYT+MvasU1Y1ISVuj8+Qak2Y0rUEVitTih/1HdmR1mOBQ+sO52VYUj9i7gmzUMaAbLQNpejJA/XUZFTmJxn2g/pZMh2g/FyYUIeH9MDsoYE8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JDPChipd; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JDPChipd"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so1241504e87.1
        for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 11:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583011; cv=none;
        d=google.com; s=arc-20260327;
        b=r1ip5rrXl2jku60Qmc5DbZJjWDZDGvMel02kK1P8uI65rbpMBfqFswB+mhegVmOjvb
         tOGSHnqyTAYzRUkkzXEm5/+Upb6Nih5dU99wEbGhOwZFVLdiedgqQmeck8eow29gu5t9
         lfXYdIAtmAVAFlKIXL/SrTCb1VlH/UOBKb9W6AmC30zyHy6feh0xn4+5a7R72CcuB64Q
         QsYN7bb+Hbmgc4fJnLfIWGjGCwoNMw47QETveEJ+g2GrJq2BMEAYIZvyt35iCC3MuG9r
         1y1EKgJKuo7mKhqxllmjxNJvA40M/velghvVFJgPdSa8Ciwa3jtkXVj1OE4mfaiLlNVZ
         6Z6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        fh=o3543LnceJjduAXUlTMinMUsR1hbqj+SaOEC5CT36Qg=;
        b=o8GAwjS7E7yzO15iRKzYnjBFmbWPlHXdGu0Um9vo/OeKxBQ/TBMoyuasIyVWkHJbWq
         If3BJeU9gCudqNyjbkJNndzb4xfSLzCgsC1VJdy05iFdaEyjZMM7Ni45R84Sr/RHGPtS
         CqnhQxz87mngJph9ciBPBZo1AO5pSh3ZSyiLtg6BjSle/PtTIXVUohfzAwnyJPGUwZCm
         Lb/FY9m9zLayT3W/nSz7TUrzg8Xbpr+wKM0/dNCX8+qKl9zlLDI//n4VkJ2Ua/mcrt+w
         PXUd6rlq7Jk3WzayHV3V2sf8pMvhqn+Qcr62jvU+uwKt+0Gvsz3p94+d3ZCCEFK7Que5
         M9EQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789583011; x=1790187811; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        b=JDPChipduRYrBvPo4aR28TNSvEdUz7CQX3aOqzKMBUu8nUv/A6WIzWUOnHRAVqv1Kl
         6WJG8I5KOtcWTuit0h0R8WpHELpIGT3ZPeFYYm9bo71wOGaEVzRI27MYoSAQPimJThwz
         j7V0m36C+jXei/RgjYHdcOUUsrwqB0YnzKoyhtIsTvEl0ClIgrlZ1q1ar0Fyuod7RyCt
         CRyU0EjdhcmAbxNiieNvprkory5j63zXzQVMNrlzt6bt39N2BWEmbC24f2M2qVsdx1Br
         a4ld038GxHBPW6OYqGQ3PxbZCVtVbFNSjnZ4ETbr8SQR1MX0ur2ZTsSxdYfjrW+ktvuF
         fAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583011; x=1790187811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA6WOY7U5Hpnzgqa3cIbAuP1d1sT3cNwxEh5sU4xF5Y=;
        b=CcP1J7v/9y+2+Qogy9uqdHwBDS9BDD6UVdcFb70JnkfxcB/IAmytcFB++qmVkrjcFv
         1WbLsLulLxn7Nl6Y9r2T6EX5D/SuitdFVQLdYgtdON5mh0c6vgRINpQvkZ9o4wEnp70V
         3muD7VopVrBqoRW7olura0mAvUFfCj0icf6SA0dqKtG76Ltl9K0944sQuHERp2mHkbyT
         CYGV9VXsveO1KMXo8KuKGzm93gX8pNC+grVNp0yujRjV4XQA4UDCgOtmqSEuyQNUp8Zd
         12duZMLgPSRWF0MnBgN9FAZjryvXMG5jNIyb8nHVAHDTNmOIC2JYL/NTEWerr5RsTFzk
         hMOA==
X-Forwarded-Encrypted: i=1; AKwUvBweLmzvaJ2KjO6PIGcqjMf70dDjqFrobtVpZFNNqNxDv1X6sV0rz75nP948gBEKUyOi28bZd1vtEa6S@lists.linux.dev
X-Gm-Message-State: AFuF++mIOha0V/HzNUGs6Lqm34R62XF59aVmmeLg/dA1bkxGDOdsYcJD
	j9YQVNJ17ofrZL9HaOIJ4/0/XK6V+6+SJRat/YnDH9ZXpq2iJJ7vwiKhzBV21YkVi8XAsrr8gko
	tH6/NrnKxbbd8SsUAf4PMyqUt5sqExMgwkUK8aMkJ
X-Gm-Gg: AYBFou3zWkCU7o2l9TTt9jtD/jIbsadjONX+YYh7lZJt5KZeaZpxoydffmTP6YV96Rk
	sVqZX7jfO7bzKWp8qv6pOnTTKAfhElluZ4uA3cSjLCJHS/PmzHW/hTDhllYJ8Ege7YO5vSQkJzy
	l0FvC96h0YFRiPMtf2KH5p5Vqk65F0kGjeM08sG3dA4+wvXhz3ZRkRbgLyFdFE4cG76+nN6Gjsv
	yfYauZci+LqmDytZxxUdm3gfSMYNtIzYljvhN2q4ldf5mPg1jCNJF2iGuOF34yzCWWlBel9NhFD
	gkzXXqUXg4E/1LRoQ6ndar5phB2B9bjsB1RxHHfI33PNR135kT4giA==
X-Received: by 2002:a05:6512:1293:b0:5b6:1a7c:aa13 with SMTP id
 2adb3069b0e04-5b8b6640be1mr1009695e87.43.1789583011057; Wed, 16 Sep 2026
 11:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912083611.2513845-1-suzuki.poulose@arm.com> <20260912083611.2513845-7-suzuki.poulose@arm.com>
In-Reply-To: <20260912083611.2513845-7-suzuki.poulose@arm.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 16 Sep 2026 11:23:19 -0700
X-Gm-Features: AcwNN1Xa9rZlSKbZ1HJXqNvz676wwtG0Dzc3HxbzhCyZpg8GXZHTQsxrOGLMh6o
Message-ID: <CABpDEum16ZzLSjd7Yg2Ge6VjwL8S8xxtSs_AsqOeNT9-9FNKKQ@mail.gmail.com>
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT entries
 for memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:37=E2=80=AFAM Suzuki K Poulose <suzuki.poulose@ar=
m.com> wrote:
[...]
> +static int rmi_init_metadata(void)
> +{
> +       phys_addr_t start, end;
> +       struct memblock_region *r;
> +
> +       for_each_mem_region(r) {
> +               int ret;
> +
> +               /* Firmware-reserved NOMAP regions are not usable system =
RAM */
> +               if (memblock_is_nomap(r))
> +                       continue;
> +
> +               start =3D memblock_region_memory_base_pfn(r) << PAGE_SHIF=
T;
> +               end =3D memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
> +
> +               ret =3D rmi_prepare_memory(start, end);
> +               if (ret)
> +                       return ret;
> +       }

Hi Suzuki,

What happens if a system has memory regions in memblock that are not
tracked by RMM (e.g. CXL memory)?

Currently, rmi_verify_memory_tracking() returns -ENODEV for untracked
regions, causing rmi_init_metadata() to abort and disable CCA
system-wide.

Shouldn't rmi_init_metadata() skip untracked regions (continue) with a
warning/info log instead of aborting? That would allow Realm support
for conventional DRAM while leaving untracked memory for the host.

Thanks,
Alper
