Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF071289358
	for <linux-coco@lists.linux.dev>; Wed,  7 May 2025 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631643; cv=none; b=GIREvUGHfBHwSU7yEbMOEW7PMV2YAYkjXABHLi9607vLZENUmPjx19XPebdsmBzQoOywkrgh/NPvcWy9Qm5de6pCEg4s02CAYWnkkUurm3FHqBoXov/wVGpW85Xu3icN5O6DAcDR+D2OzGp/XQabJVohNOdZGHh+iLFqGsfWCxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631643; c=relaxed/simple;
	bh=RB5x+S+YxBY2uweoaKwC9lZHlxnJE1L0fDzjyErwVXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DC8L58d+VK6xjom4RKA+xfnSaHAOAAbmDhP5Effc9oTLkZ0oZ9/WZznjIDpAwjdsqwzM4YwMr8DmLBqQlY5ylT5LcGPr7LwMfqab3S89hF+WwtBxoJDM4SENmcksqfniNmjxl/FTYdEeZfiJju/CwmJie9u7Vwbs2xbkwNeHalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=thcLe73W; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="thcLe73W"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso655e9.1
        for <linux-coco@lists.linux.dev>; Wed, 07 May 2025 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746631640; x=1747236440; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UVScMaJsNdWzXaWbUOC+RQZonS9hMcxETO6CXiEAlRw=;
        b=thcLe73WQl4X1cCgBFFPNeL4tGRsiVi84GAwc85vjF416FXTV3e+VDKh0dD/CK/JT4
         TQgf3BgP3PRyD3Sv6kJ8e5UD7QRboAjOVHPXJePvv2oJFqCX4oZVYWqU+DZLw2ALBhrB
         KtEV1R8gEl3n/n8IS08EkuXnBj9X+OsttS4LSBVHC93Ygy++71FOxjN7E2a0ElQt+pb5
         /bEnA6de07ltUesY8dJOuI4aXJ25nZCCm3uvh39ARHCKat5AKs6M3SwXJOaAJQutozGv
         xjVaoijgdxiP9Xn7Z/66YQvkC+JaAx3qFV3Pni57xtOElENpNb7q9atmFgWKyhQ4gUJ2
         NcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631640; x=1747236440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVScMaJsNdWzXaWbUOC+RQZonS9hMcxETO6CXiEAlRw=;
        b=i8H6hKhPty9aoXciRzLuBZEdk8QZKZRmV3Z5MUtQYNjuyiCSDFMWTpE8RQxrh9hcvf
         XcKE/z10A4zBmDHV3XfYOe3sByPrGLrUshVFrQ5jLaFQ+OqsmtrZ5OfxGBPbqEqjIffT
         cCAeit3h2OvffUZAhJ77uFdMobD5jsFALREPSpR2vCWkZ/6+CUQlkHIbHqGtgNqtjkyZ
         n9ucLq9xPZMWiQjsATj+5d2DGfncWY661sQKEPetAiMWVySN83uuJ8tyt8gKQaaY9Lm4
         g4pDcfb/0TzjRvwRKHKEqR6VjONT5XkEHpuCpa0SYbjNQoxcsiqxILy0rCuAzWx0kMma
         DJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrgh8iuYtZ7CY60ggOMdjh6dvvykp38fhK7Lr3sobXUAi2/GSK3bJ04dWfc/jjxmd2Vro9i5grm+Tb@lists.linux.dev
X-Gm-Message-State: AOJu0YwTOIqboq3gVSTV3CLkivGYc5XsngP52itlA96TYOTtvDc3OuHx
	o8LPbWg5Uu31DVZ7HHTejdiAO4/wyoBXmg3hmIv2kUj+MwnG+eOMZrRLSVgZtWP2bD8AMGKfAqd
	Q/HWx+s/SOA==
X-Google-Smtp-Source: AGHT+IFbv1gkzIUlafRoPSulkZnF0yX8hhTbcTrPKkzq/6eQOecLcqYYtCLGIV57zt9Rt/Zmw0wGOrsHsd3dlA==
X-Received: from wmbeq6.prod.google.com ([2002:a05:600c:8486:b0:43c:fd99:1b7e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5122:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-441d44dc257mr25363515e9.25.1746631640335;
 Wed, 07 May 2025 08:27:20 -0700 (PDT)
Date: Wed, 07 May 2025 15:27:18 +0000
In-Reply-To: <hqd7h7elpou6mohkdr2rqcz6u7xuanezuq3ti56ibsnccsb2d2@yokitckdkwqo>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com> <D9P3X0NLQMW5.1J74MJ7FDRBFB@google.com>
 <hqd7h7elpou6mohkdr2rqcz6u7xuanezuq3ti56ibsnccsb2d2@yokitckdkwqo>
X-Mailer: aerc 0.20.0
Message-ID: <D9Q18PJT3Y7R.5Q9X3BZ0ESYU@google.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
From: Brendan Jackman <jackmanb@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: <akpm@linux-foundation.org>, <vbabka@suse.cz>, <surenb@google.com>, 
	<mhocko@suse.com>, <hannes@cmpxchg.org>, <bp@alien8.de>, <tglx@linutronix.de>, 
	<david@redhat.com>, <ast@kernel.org>, <linux-mm@kvack.org>, 
	<linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue May 6, 2025 at 1:34 PM UTC, Kirill A. Shutemov wrote:
> On Tue, May 06, 2025 at 01:20:25PM +0000, Brendan Jackman wrote:
>> On Tue May 6, 2025 at 11:25 AM UTC, Kirill A. Shutemov wrote:
>> > +	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
>> > +	if (alloc_flags & ALLOC_TRYLOCK)
>> > +		return false;
>> > +
>> 
>> Quick lazy question: why don't we just trylock it like we do for the zone
>> lock?
>
> It is not only zone lock. There's also unaccepted_memory_lock inside
> accept_memory().

Right, but my lazy question was why can't we "just" trylock that too?

But anyway, that's no use because if we win the trylock we'd still have
to do __free_pages_ok().
