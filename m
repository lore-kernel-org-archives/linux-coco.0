Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91D2D94AA
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 21:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798658; cv=none; b=gN782y+DHxS4WGcjicdP6UL99uhphek6BR1u0ue6zcVR5lOzbu54c2H9S91eeNe4mmN9rK10EJfbuHMykicaZtYJ68jDUvpYEC+q/rk+4S0+gYJneFe3QgG9uwWo01cbMAHxAzfwc4L21IAMeo0831MCwjR1jkvrTz5mlD0N1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798658; c=relaxed/simple;
	bh=JHGfDUlew2CsaKlG5OfBOmRmtuZxeRpVwjd7Xi1XEPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnMLny6ERNOFCpoXJfVdyFjGvH2IrvulrUj90Sw1ho4tEgzopf8vKiPYpepId1MzXkyKnnjFFnmqOprVzb2inkGfjIORsUjo7WCNk9bDajr/brQjjsA/qyprOm6UuOVg6rbzVSakEdu0Z/mSq6xxA58cBiODR/aLWhTTGSFHtkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ikeHG9X8; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ikeHG9X8"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8823d5127daso2010256d6.0
        for <linux-coco@lists.linux.dev>; Wed, 03 Dec 2025 13:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1764798656; x=1765403456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1L7bCsctlFH/rlCsw/yhcu41+Ux43nXuWYzbJSS1oM=;
        b=ikeHG9X8nu2FtQtxF+id1mm4uoj9SKW42i7zabkwz8iRBPhwlVv1c+ekiBuw4qBZpe
         wWqUF5JF9XnBUPzIu39+6jtfF00WsTjdxU+92Kmn1xeoWtZeESc4FH0dnK2Ue5nWcKIE
         Ocor8iaUkkst+LKeG3f0rokHVSUscGOCEbE2ihsHKmgbKx7k9MnFMFllrNmRxJfhNBeP
         ZEVfJUXnM7aGyWYI+4OTVWgBvN8oWFv5ld9o+NaxriIbMI9lbyG3GGY5SUEIA1JDi1uo
         f3QNU3KwHBhAhT6yr2OFmmp8290sJddR7SgtzxfrQ0ERMWMSaFbRWr/GnwPoPlEqx3f6
         bZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798656; x=1765403456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1L7bCsctlFH/rlCsw/yhcu41+Ux43nXuWYzbJSS1oM=;
        b=vK6i5v51EgPqEUnxJ6bBHiruXUGv7JeRH8Ysh39Oe4WlJom00SDK+Bvm8PsfjTP174
         xoG+IOb26ISYLHDE6ZRGQitenxA7PFN+hNwuDxkMRk55+AWjbepDihG1UH0S51bOPUBD
         SOoOClKIZwZ7Ef7wxcHIch16Ll+m3katqo59AEnKZgo4o4vrO+mR3ch8weMUvXaNlX69
         NfTFlFPVYjDOrgoy46FYiwG1npfVHqRaml45rNBCo6uSlb93hJQm2KOpWVTHrG9jKh38
         0NDy+4RlRrOjMZ5XqcoCMoQEa1cMhMphaspcmXsuHFRgwtzw74mL5clmy7toX3Kz0+TT
         6Vhw==
X-Forwarded-Encrypted: i=1; AJvYcCU25stry9SD7x1MUhk7vk3/D85ZngaYdd6Rpf81xAnBxvOuVDY9UDcpwuNid+m+xt+FXUDCArF+0FCf@lists.linux.dev
X-Gm-Message-State: AOJu0YyTkn4Qc2msoC0wycV/MepsbO40fMNKDRM8fH+ojU56D0wbSH8U
	TTJo3fA96sv60IVnZvw/iv9yw7bkR1Q+WYvgwKXDas1wErMNjhrW0ckqguel6Eomb0U=
X-Gm-Gg: ASbGncvopKcq+9vplgbXJe/oE0B0isSSMjZ2F26ZsQgR0DByh7F/VDMbGUh9FcvVF/e
	KsuqKNVzAi9lgNrePK/Fp6j1XDEfldeUMKshLM6+oXDcNQiHJ/QrVyI4yXMysbb6ZhePeBxc1Yy
	VOQhpHRCGKJwof8Wj1p+e7FR4rhICtWRAsH6vvOxSNdDD1a36O/tc4jZmhKRzxWYb0eXDeySaIt
	pmWCMMVuajriMsOd0vImU/A3bEDRlXcGaUszYMXs5p1EUKDq/SC5MG+iV+3AGJ3Gg6/Ti7FB3Kz
	cC5Kzj3WK2kR/JVi9m01w2LauONzxuyMtWffDTReFHwWX8gX4l2bMh6W9Mx16dQGlOhI1nAnLLN
	7nf0rMEjMFDlL5Cc1E7CYCyh1SvNVH4J28hZsXt5TmzNEBmLV6WTsCdJHaGiKplHK77ITmw5GZf
	VV2aetXU2DuJyxo0KlH7GI7/CcmDw=
X-Google-Smtp-Source: AGHT+IEwceVsLeU5TI95jujZXB37aK5lP0n1gzmGLbDcAQSJh4iH2YFhpUVYfybMssUZm1JTFXzafQ==
X-Received: by 2002:a05:6214:500d:b0:880:5389:a77a with SMTP id 6a1803df08f44-888195726c6mr64755976d6.63.1764798655692;
        Wed, 03 Dec 2025 13:50:55 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524fd33fsm134692766d6.24.2025.12.03.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:50:53 -0800 (PST)
Date: Wed, 3 Dec 2025 16:50:52 -0500
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Frank van der Linden <fvdl@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
	kernel-team@meta.com, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	kas@kernel.org, dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com, muchun.song@linux.dev,
	osalvador@suse.de, x86@kernel.org, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: [PATCH v4] page_alloc: allow migration of smaller hugepages
 during contig_alloc
Message-ID: <aTCwvKRoVGs89BVX@gourry-fedora-PF4VCD3F>
References: <20251203063004.185182-1-gourry@gourry.net>
 <20251203173209.GA478168@cmpxchg.org>
 <aTB5CJ0oFfPjavGx@gourry-fedora-PF4VCD3F>
 <CAPTztWar1KqLyUOknkf0XVnO9JOBbMxov6pHZjEm4Ou0wtSJTA@mail.gmail.com>
 <b5a925c5-523e-41e1-a3ce-0bb51ce0e995@kernel.org>
 <aTCZEcJqcgGv8Zir@gourry-fedora-PF4VCD3F>
 <f6b159c1-e07c-489e-ab9b-4d77551877f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6b159c1-e07c-489e-ab9b-4d77551877f0@kernel.org>

On Wed, Dec 03, 2025 at 09:14:44PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/3/25 21:09, Gregory Price wrote:
> > On Wed, Dec 03, 2025 at 08:43:29PM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 12/3/25 19:01, Frank van der Linden wrote:
> > 
> > Worth noting that because this check really only applies to gigantic
> > page *reservation* (not faulting), this isn't necessarily incurred in a
> > time critical path.  So, maybe i'm biased here, the reliability increase
> > feels like a win even if the operation can take a very long time under
> > memory pressure scenarios (which seems like an outliar anyway).
> 
> Not sure I understand correctly. I think the fix from Mel was the right
> thing to do.
> 
> It does not make sense to try migrating a 1GB page when allocating a 1GB
> page. Ever.
> 

Oh yeah I agree, this patch doesn't allow that either.

I was just saying his patch's restriction of omitting all HugeTLB
(including 2MB) was more aggressive than needed.

I.e. allowing movement of 2MB pages to increase reliability is (arguably)
worth the potential long-runtime that doing so may produce (because we no
longer filter out regions with 2MB pages).

tl;dr: just re-iterating the theory of this patch.

~Gregory
