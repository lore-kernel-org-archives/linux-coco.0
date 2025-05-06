Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4717D4B1E61
	for <linux-coco@lists.linux.dev>; Tue,  6 May 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569145; cv=none; b=qBAlOHKnr0WINQUPLjkvq9k5sbbGqk2pzBNuEuWdGJYYUPfkPRb4YV8fXJk56gVhtNcBePpFJPGHpSfi0xdCOjnbzekQ1E3GWwNdJU3qPC4KkQeMHlQPyvQdadu7X6ida2Qd5yj8keOmbmtFFJO4m5zmQ9D0oayxw1uVmUjcGmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569145; c=relaxed/simple;
	bh=KipRk4T764WfCmu0wFyxjVxI3EJCSRQ5r8frLRwrZrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ES4QEUSoo5FRJyTZS5KOid9LJrrazbUmvGz+FcPft9kMgI+J0SQvMwQWuTDJ5uj9BjeR8xOcJY2F9aiOzRcDoX/s3I2UbXuRkPAhyQJGwTq5dpHWkajR7mpuSoDBK1FZhhC3X7pOeOUt4+UuxbpQ8pfzLBiTXJwelXzyFVZn+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAdMucHn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAdMucHn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a07a7b517dso4065960f8f.3
        for <linux-coco@lists.linux.dev>; Tue, 06 May 2025 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746569142; x=1747173942; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KipRk4T764WfCmu0wFyxjVxI3EJCSRQ5r8frLRwrZrw=;
        b=VAdMucHnUOyBE9VI74H7Wh8z5No6f0FlhjR3Eb8zeolKy1Gd+PQhrCMEdI3uOL3adE
         ymKhQL9ygoB0ASSEoHk2b+5y1l/MoA7uvjYfMU9GTIYp8og4HUVdQAT+nG4JPR9s8IQZ
         O/s4ohnsDNIGh4bXkt2a2ckaR/Z7CcD96ZnPM3JFgEIHg9Y4YTx201hxga881SpfJ/D9
         w4qN4j1GEzwlgYtwvXetIkpFsKgltFhWkKwxeYPTKg2MT0OLE3ltIeEE7F32bHdDMGnK
         qI8/jMK5rZL1QpBCsJFZnuvCk/3ngbgtcQUAAkJNdGC5p+KYwscMaJylnLYA78tBnjai
         XJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569142; x=1747173942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KipRk4T764WfCmu0wFyxjVxI3EJCSRQ5r8frLRwrZrw=;
        b=OyOLAv+96PNuziO5af4upQ/42S/mm9bfGOIbMTaDQwhxSvUt+J/I/jwSbJmrrRoKc6
         /X66INfQXzQfqbCAkYioP0jXNx6cKwOwgPRIgYeAWfk3ja7ICWaP2Rz9uzyveAjBmtIL
         SXiaTfQfHGsvXT+hlU/YIalTL+5EVJs71z0F6dYfnM6ufESftxIRSWYdWZKDvsLkLcWF
         M6NIIGH3FVUhyVQiFtWyz2UQilmgJPHtqnXqA8nKi37iP2zGjt2xXjV7Taw3TVsErorV
         vsJ2w0TUSpEQYjaDHHfu9lmIXZFhER7GeAGUvx3LB6jQamXX9Grl1XBXh7UsKrVpdETP
         1G8A==
X-Forwarded-Encrypted: i=1; AJvYcCUH68V74xlOTOdZZk6AEdE0ah5qvYkjYSMQesXiXdItrOhKsLukmioPKM+vyGVpkcEO+6XxLroGrvWs@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh179d0V7SQVskpv7gtC9kC21htRJWPqOMqeKXnU7bbT51uPpf
	K61iE5cdqdpnmmse4QcPKqkKz6WGj8iXCXzn1J2C+moV6q6UYxSkwijqz310mhd2DyNqMShnrx+
	0Zu66OFUZdMUKKJaxl87xHvaHm0A=
X-Gm-Gg: ASbGncvCa+4tqiyUkXqIEWOEO9PW3MviIjFqqW9zIZKbiIROB1Vfvg150j7VU2WWzB2
	xY2JSiDyYkJRC8KLk6S95xtIdbOjfzm41UT6DMvHwjQYESyv/HpAygx3kxEfNLkD+5F27ts34Xm
	uXGmdNcnxPixnAsExvbOoUrdtdPKch1qlaulQwpj7xX/MY/jmBHw==
X-Google-Smtp-Source: AGHT+IE25DZ//XnJlkjj3EH8ZFFd41BFs36NSpSFuQBE3faebw8bT1aWwOWkbgGGp64gVRd3F+KAiVR2q0MyqbOFdc8=
X-Received: by 2002:a05:6000:40cd:b0:3a0:8712:4f51 with SMTP id
 ffacd0b85a97d-3a0b4a14668mr771413f8f.40.1746569142426; Tue, 06 May 2025
 15:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com> <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>
 <5loiv7lfplpruujplz7wmzj25g34rs2aezvrfsl55dsddrh7mo@rnqrlx5zccol>
In-Reply-To: <5loiv7lfplpruujplz7wmzj25g34rs2aezvrfsl55dsddrh7mo@rnqrlx5zccol>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 6 May 2025 15:05:31 -0700
X-Gm-Features: ATxdqUEFmKJx_9lHRGWUehox8hv3ijG1FV0mSYp85G8ha8fWtihliKeq8C6j3Ns
Message-ID: <CAADnVQ+jf+Z+7prRaK3LopmZLtKh6JGzvi2+WZcvLo1DGcLShQ@mail.gmail.com>
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

On Tue, May 6, 2025 at 12:00=E2=80=AFPM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Tue, May 06, 2025 at 10:18:21AM -0700, Alexei Starovoitov wrote:
> > On Tue, May 6, 2025 at 4:25=E2=80=AFAM Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> > >
> > > try_alloc_pages() will not attempt to allocate memory if the system h=
as
> > > *any* unaccepted memory. Memory is accepted as needed and can remain =
in
> > > the system indefinitely, causing the interface to always fail.
> > >
> > > Rather than immediately giving up, attempt to use already accepted
> > > memory on free lists.
> > >
> > > Pass 'alloc_flags' to cond_accept_memory() and do not accept new memo=
ry
> > > for ALLOC_TRYLOCK requests.
> > >
> > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opport=
unistic page allocation")
> >
> > Thanks for working on this, but the fixes tag is overkill.
> > This limitation is not causing any issues in our setups.
>
> Have you had chance to test it on any platform with unaccepted memory?
> So far it is only Intel TDX and AMD SEV guests.

We don't use them, and my understanding is that such
unaccepted memory will be there only during boot time.
