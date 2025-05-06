Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01BE220F59
	for <linux-coco@lists.linux.dev>; Tue,  6 May 2025 17:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551916; cv=none; b=QHyOG6fn0beTQz6ZWfoRi0cGq/9vlO8oE6+cnf/DoQEMLCNgyPv0zAQoCXAPa+5919EVsCmg1Z85giYtn29LqrrCD/Qcw/Yg8JUP/nTXVDUcfeGwTOY5gqM6UfpzINx1LDOWYGQa3bqbz1YKN4GMCWb+mValr3lKaNdpdigyhls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551916; c=relaxed/simple;
	bh=I1GUKXRG1sS0I2MpQXF5etwohdHLhGjvcYGHi1qYNI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiQXEyxTOw50hGLFKFBmiRMSlUpPpcjFgFXDu8mlIpEQRyiWNzsVeEbHDBE3AMLYieeiJO6D5LS2vLZjnwX6iqW2ZGCuuYNGzOOZqDISphiI9AlzNXAWbFKIeGeVTJt8CkhKjgrIu6yXfDHK5eUphHM3UjelQxYEaCYzu01xpNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8anOXC3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8anOXC3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so39999945e9.1
        for <linux-coco@lists.linux.dev>; Tue, 06 May 2025 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746551913; x=1747156713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1GUKXRG1sS0I2MpQXF5etwohdHLhGjvcYGHi1qYNI8=;
        b=G8anOXC3/Q+Obaxd25ccM5Dx0Foz9VvrNauvQ7+eNSOL0c53iaU2RLXH4fAjUozSKX
         pFF5krW5aR6zBw9oFhQ5Wc/BGkFgKGupIsSKotky0yAnZDSQ6YkCsk6BTW1yCHEaPGx4
         xYO5JY5sosBsVzmmXiFbNPJfjho7DluPtTtXHudL3Xsx025pNx6KZo92fVnJBQxuryVk
         7VcXzefaBfEl+67zCoFnAnp1aw+YWLHxx2TNfmF56269L6Y0eJgJU7Ip/8gsM7RAtZaq
         etHIqKTuXqGZfI1dCpL1YlDqQUqXHg6CjOjMfg6Ct3ZNP7Z1/xeoR9XEvK7H+wWEoF2n
         Psww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551913; x=1747156713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1GUKXRG1sS0I2MpQXF5etwohdHLhGjvcYGHi1qYNI8=;
        b=Yeh2krs4wQTEUr3HnFwqcI+I2QrZcYiVVLOEx/PSwSYyp9r7mpQoRSb4z0Rhy88yA1
         zPW+eCBqWP1dQtpoh2kF7DfXzEFbe70J13FWb2FrcAjkjG7kIQqE/dquVQIHGAA/eQG1
         zzF9JB5ljSV5ICu2Nv4Hzugb5BGDXdRj5MF62HnKBYpOjEHHD4VvomcQIg65pJ5gGExu
         wOIvJTFeMAyr6JHgOgY6MOmzg2KWLVBMzJEdIikjkdr84lBsqGcsKLd2w5U8UYLHbKlW
         yS60WhBJSPwcnndWqOGEPBoAhe64gxaCGj9WlM8J63+BoWIaYcl/MXqqOF3cPYSuy8//
         5HCg==
X-Forwarded-Encrypted: i=1; AJvYcCWLR4mX1OuU/gCAMKaFr+iPSn+DpCXpRxkjedpOYQhTk0ROwdencrSkJxpkYJLjY6xuUppGA5R1kVTC@lists.linux.dev
X-Gm-Message-State: AOJu0YxkKLUSCveP1PjZENIOWOXCzamATItxbuGihiQTyXejjEh6yfs5
	Y5fqp/S0MjwRSZ+5EAWqUVKX9BtTAmc4Ts+weICHRCYMAektW2k0zklm06uY7JHreKVvHElxJir
	dZp5EOk+sneYUrgMNXJNEOJSBFhM=
X-Gm-Gg: ASbGnctep68Ioz1ZKoA0eYSrmMv79vQcm/H2nzpDbEvo6b2AmnSnv+7luIJGkJ9Exf5
	Y7GrwIwJ91VhjiUglTYkUJpaT+KzAqOVFK29g/dRIdyIk5TPKYUkI5R5A5LRFKTjrPAyrXvGDO7
	izzSIQD9dV1/kRQpGMzSjbqi1/gFafkLiXSFyvuQ==
X-Google-Smtp-Source: AGHT+IHQuJXcdGhW4RBQiLlShD7u+LNmA51eDaVMk8p5aLAsflo1j9UpfI+KpsgbKf6Fl3aQPBcsLRNXOtKLMLQaDQ4=
X-Received: by 2002:a05:600c:5491:b0:43d:fa59:cc8f with SMTP id
 5b1f17b1804b1-441c4948909mr87467725e9.33.1746551912968; Tue, 06 May 2025
 10:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com> <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 6 May 2025 10:18:21 -0700
X-Gm-Features: ATxdqUE1cPmGJ_z0_R-l8WcbQujf2UehrtXW9TqppyzEM5gu5W70jKsdFwzwy6M
Message-ID: <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand <david@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:25=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> try_alloc_pages() will not attempt to allocate memory if the system has
> *any* unaccepted memory. Memory is accepted as needed and can remain in
> the system indefinitely, causing the interface to always fail.
>
> Rather than immediately giving up, attempt to use already accepted
> memory on free lists.
>
> Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
> for ALLOC_TRYLOCK requests.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opportunis=
tic page allocation")

Thanks for working on this, but the fixes tag is overkill.
This limitation is not causing any issues in our setups.
Improving it is certainly better, of course.
Acked-by: Alexei Starovoitov <ast@kernel.org>
