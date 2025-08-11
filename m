Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0920C001
	for <linux-coco@lists.linux.dev>; Mon, 11 Aug 2025 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922858; cv=none; b=fhXdAIeRQTli3b76t8O6AmsrQM4XGrC1VdimmjBKCZjHvzDtIyu5rsTdCVTmxnXFs3BMNMzXJ2xR+ulJOo/8FBRO+i6xlffUnk2UBqgh49HINC+KANvl4OPGaQ/InIOGqmopxjZvH6ooU4QV1p507ceTNmWUPvs8Cixu6xkZ6UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922858; c=relaxed/simple;
	bh=bruREYZz13FVqwhmiTuhvJnq89yjM0qtV4JcUUKirMo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sXR2uCP+8CkQ01XmKwIUO7nOGuMG1CQQCJ5hK4JH7CMepjtFsUFDJeabCipDLhPql7yV1hUpbRZhLM9jDiRX9TpIMi6r9MAfXiSh1DE0PMXsdyoJ2NB+wf0WWze9gV5zHKIkFFmHeJKX7YukDk4rjG7aaresTMawGaGXGTPhY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ivvD65mq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ivvD65mq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-76c67258a9dso3248848b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 11 Aug 2025 07:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754922857; x=1755527657; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3QC/DofyyJ1kIbquP7TygGRJBogDIdpEUbLnTdcdHg=;
        b=ivvD65mq+FKQwMt1x79FNeVXlcYtdeexE0bYsUuqNGMBxiKJdlbqfEutmHVrxb9BP7
         aoE8Y59q4Ao7rRP0GsBEUvH24PGwbP9tl/u1Jm8OQ/kSiSl7yQZqdsSGY5Pl/A4/afKG
         W6ulSgMn+6qWolmnekUdoiLrUfXEyNyEv4PTkl8+SUEBtLj0fxxJ7ga/XQppNQ54kWho
         0oNlX6q7yJKLbU8glHGiQK/FYy79zzWLd2q3V9E+f3I59a4jUo8Zj6IUsKzj83j+OYbG
         SukZ9KuR1GdhrITfA6CIJeLf6ZUDx9BFI1c38Cj4PP1z1Z9wmye6F/yEXHx4y7abyOpP
         l9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754922857; x=1755527657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3QC/DofyyJ1kIbquP7TygGRJBogDIdpEUbLnTdcdHg=;
        b=UE8OtY/mFnwo21K5KFN/rLoqzQbuwyy1FEd1L8hK/4vXa2EyJdpE65/NcIJB28lEWV
         TuoxmYH7JRdY4g3iS7/aAMPH9G7AWQ28+ZMRFe8qH3BYaBSZoHOeQUQNxKEheaSbWrlV
         ZWL5L6K0/Od4qFH53TpA5Hjhq8kRioUvkv5EG7KMJsEFHn9hBANKHE6DV8rBIqGaVg5R
         ht/y2uBsmzOUQEdaI06Gv1P9fWmUOyEhaBrtX0qh5OHSoksWAX7k132Ea/jd9yNk/Wr6
         WfrD0kh2Ae/GAxDNqo5iN+t1Vw4aG0tiovS4uvHJk3wZbIGPFdwZ4U1aUsb6EeUsdg4n
         aA9w==
X-Forwarded-Encrypted: i=1; AJvYcCVdWviNsOGLCdttujJw+62nnynv6pcYP9YW8/NZ00HGiw/WWS/svCvxRB2gOMbsnSx5SZd0H7EFYhUP@lists.linux.dev
X-Gm-Message-State: AOJu0YzU7n7/ExNOWzx5LmDI4HQ+bDY5d5wefTS2e0Opk+9JWLu+QfET
	5znfAnQ0f+2tbPT2qW0geDjyeekL9Z4A1ZEmRO/5Nk7HgCPOYbjDsbmjwyieSoM9GBTB9VjMI74
	660H5Dg==
X-Google-Smtp-Source: AGHT+IHDzFt+0zXjA0CUz3si8YkwDTRVPFUsiiRh4VZN4Dkprgq2wlq3CPL9ofZgO6/62HnwUQZt6ujhFVk=
X-Received: from pgos21.prod.google.com ([2002:a63:af55:0:b0:b31:d198:ffb2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d8b:b0:240:6dc:9164
 with SMTP id adf61e73a8af0-2405502ffeamr23223057637.15.1754922855887; Mon, 11
 Aug 2025 07:34:15 -0700 (PDT)
Date: Mon, 11 Aug 2025 07:34:14 -0700
In-Reply-To: <20250811090605.16057-2-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250811090605.16057-2-shivankg@amd.com>
Message-ID: <aJn_ZvD2AfZBX4Ox@google.com>
Subject: Re: [PATCH RFC V10 0/7] Add NUMA mempolicy support for KVM guest-memfd
From: Sean Christopherson <seanjc@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: david@redhat.com, vbabka@suse.cz, willy@infradead.org, 
	akpm@linux-foundation.org, shuah@kernel.org, pbonzini@redhat.com, 
	brauner@kernel.org, viro@zeniv.linux.org.uk, ackerleytng@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, 
	bfoster@redhat.com, tabba@google.com, vannapurve@google.com, 
	chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, michael.day@amd.com, 
	shdhiman@amd.com, yan.y.zhao@intel.com, Neeraj.Upadhyay@amd.com, 
	thomas.lendacky@amd.com, michael.roth@amd.com, aik@amd.com, jgg@nvidia.com, 
	kalyazin@amazon.com, peterx@redhat.com, jack@suse.cz, rppt@kernel.org, 
	hch@infradead.org, cgzones@googlemail.com, ira.weiny@intel.com, 
	rientjes@google.com, roypat@amazon.co.uk, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, kent.overstreet@linux.dev, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, chao.p.peng@intel.com, 
	amit@infradead.org, ddutile@redhat.com, dan.j.williams@intel.com, 
	ashish.kalra@amd.com, gshan@redhat.com, jgowans@amazon.com, 
	pankaj.gupta@amd.com, papaluri@amd.com, yuzhao@google.com, 
	suzuki.poulose@arm.com, quic_eberman@quicinc.com, 
	aneeshkumar.kizhakeveetil@arm.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 11, 2025, Shivank Garg wrote:
> This series introduces NUMA-aware memory placement support for KVM guests
> with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
> that enabled host-mapping for guest_memfd memory [1].

Is this still actually an RFC?  If so, why?  If not, drop tag on the next version
(if one is needed/sent).
