Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50E3A9611
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 22:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787957546; cv=pass; b=ie2zkHL+7Ez9I9hlDY2bIefgbD/Y0wyOpnRckuad9kw2ssb7xJemE1JBe+cvlawwH/7tPrf6SCx237bMGq3rJPG/kG9/hj4hWV2RTWqNboT7vlDuXUR7GHUecetfPn2lrS+Bl3uJh727ingIxYEYQBrX2nSotwGpa2vemuPqnug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787957546; c=relaxed/simple;
	bh=WrsvomBoIOTykSZbu/ot0FOcIRpwAK7V3umLl1yq6rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEGLvxKSitdw/xnMS/zacnd4m4HY7SJ6hj8iKtQF+FWk9QyQ8M7zQjgbEKQEL61341k8FnuevwOtEQE4xb91WZGT9j82HdWi5KTrJ5TW8q7UFf/1jXiI2QxGVb+avst+5x+U6YDeitYuhD7OvjP/+qSwsuxI7K9oT5Znn5CTbbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m+pUhCrp; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m+pUhCrp"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c01c79467so93101cf.0
        for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 15:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787957544; cv=none;
        d=google.com; s=arc-20260327;
        b=bGjW/Y54kSCv5C6kV4MZuCHIDbZMJJcfxaUgOYsOuJOvm1VGPVmGy1zPXETVkEEpmP
         cF9eE/nAQWBkzDnQjYU5zYJFgxUX3XGcawTMujlBMqlxHn13VXaeVt6o3ezjlq3XH7Wc
         OWHUGALVIRtZviEShuQkpivLiRR4ZAkZmI576ceG5A8q/t6hZBdP7Z9dergzrXzp8B0H
         3KevsGsXYkQ6i/0ejzUt1plPsqjvFtJufxRgLx2moIoPQEhYv35hirAk9OYNe4zyRKM5
         wIYfSAljrmCi15zbNYhpVIpJbaLMr48z8YXOF6QT3aCqDbPG5mSSQkJYTytrKeGRUXpk
         3oQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        fh=KPmADgd8RkNg7Wn3HLLCQt3SGipcFmA4ZH+9LS79buU=;
        b=f1vJoVn5nVKhku49FK9Pe+2GZBE9QoEmLIDXKmLXgeD43ikJ5infyCLovwtycpzGn7
         TmmiZD7jF9xYGZ6tMQ1mmfS+4N1/AoXr81/7kYa3o41TMv9l14QvtpVbIT+m6oRTdImy
         Bd7jI54sh7B6FSORcbkRxvPIyxzyXJr2WT8uB946HqjVfsRDInGdp515vpKRMp/OKQyq
         PChy7O8L4mGvGuwKY7t5TJP/aq6ssE7V1JUdRDVTb0FqMPMbESdnUG9MXy7LWuVkyJZ4
         Uiz/Ik+fCIuK41/iKRuMDuthtCIvOPzaRUxyVAMw26T628mw0ON27WElEWSFNJxaDnVX
         NklA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787957544; x=1788562344; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        b=m+pUhCrp/X6JlU6efKpaV6dmhpuhIaPnzCClxb1ZYfPuJkbktLOypokUBXSRGQxHOA
         O+SIhZ8ZjKy84dzVyr/AIpIhBL7wE4Cjn3EjcrZeDhMKn/JFTgHr0KED0zPRtb+xmJFu
         Vm6MykrwPwW5lh544WmBSQeFtZuydlG8FTSIncL2MEvMMAqSTLrvC7OAoea40BQkf+MG
         f5sn1z1w6LFCKu8h8XygJwr44VluvIekSy8G7tbM5Q+0PBfRxQpC9vrgqKuBu16TNqz2
         VHhnJS+FjxVtWxThhsvJcPLuLH+qjhZrnvHfXXX4SQQVkzys28pdmv0qYpx3URmwD3wr
         D46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787957544; x=1788562344;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awwf+UFW2ONQrXT/1UuPyCRQCWHRON77Fg6o5pZxO10=;
        b=Wi8+N54EfLz4uP0QBqka34copQ/Kcgah1p9eSTMBFESGxlxKK07zQ4P6yxKKziwSJ2
         +alb+yf07hFpmSH13TXyXfTqgY3onf+2ephW7ij6vpyHfz38WdwjDVO2IleZ5eHJxqwn
         qEvYrWjw1BBxxGd1flWJqLwWDdgfGx1LyY9H4WvHG/Gfm+bdUZZPCnt5je2EIgrtrpSv
         AzMvjVDCe761H5ziQG8kSxML7XsKJy0jJNuBlZJy0CoSUQh+sbd7BSsMoAyKHC+Pg2vN
         IOX+juMKkVYvUpFycSx5wlOJO7cwSrv0BJ4MG/eAiIKfzd14882luLJc9CAwoibcxIol
         1anQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqhc1BiN8ojLjG1qyTDjYh7S0F3142UCN+y508DHxF7mLI1IlUa0HFCLR0lkPL/eM/KC5rx37PsxZqd@lists.linux.dev
X-Gm-Message-State: AFuF++kBO9Yq71s2rXq+gu/5+HWJ9lyk+CxqmE86+4oTq6tC742WJGOz
	5ilhUnhDZcGSL1W5AIDGsh1QSBuK062clfn1JpI0RkAxuqjl2O7opubsHrSTZRqW/0qUAzAQIIM
	N072TLxT/MIBYm/ei0K6SJNsT7JJTEscxcMUQhcB8
X-Gm-Gg: AR+sD13gUtofeCutYlFImZp1kQTQFs8VDBknvjH2Rldg0Vk9J4BigAVT9ov9hkNZ0kQ
	G2emTFyo7isy3ZGFSDkRpv+B1PmIaM9q7L94WvnQlBcWUEhXoNExz0eDfITMaOziARr37o5NiB7
	t9CsYBv1fjhRbtTt2/qSxYfCwbQScXzOpnfrD0Wgi+KCvJlpQij9985r1BXJAgR44XPgnafzFJO
	flLIWtPZFhRYsYK+uzmiBlvqHAFFGYPUAYRqGOBd9NkEhRRpd7N/yAoTFAbnTAhDP8w6uUyg0WI
	bCdBNt08KZJeCEKe9PAUCcxEQNovq1QioTDLyMiv9Ulw95Kjp623uOkE8AFTr3pDKV9bZKVm6S3
	VNO8Qq5thNA==
X-Received: by 2002:ac8:6109:0:b0:52f:9ed4:8d74 with SMTP id
 d75a77b69052e-52ff710cdc4mr4682421cf.14.1787957543079; Fri, 28 Aug 2026
 15:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806020850.1221381-1-rick.p.edgecombe@intel.com>
 <20260806020850.1221381-8-rick.p.edgecombe@intel.com> <CAGtprH8XJ+SbxQLTowch3DR6N1NSMUKyVnGf0hv5N+iKWT3q7A@mail.gmail.com>
 <74bc9f2695959f335f2f502ded1ae7c944fae13a.camel@intel.com>
In-Reply-To: <74bc9f2695959f335f2f502ded1ae7c944fae13a.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 28 Aug 2026 15:52:12 -0700
X-Gm-Features: AcwNN1XH7bepxRkIbUoAM3EdldcwR19TvPyf1EHxlXjEwu1TNfCd8rn9aVcKinM
Message-ID: <CAGtprH-WL9MioyJUwJf7XK8O+UM6d1hUwWMtPj0AWC4FdBxScg@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Huang, Kai" <kai.huang@intel.com>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "Wu, Binbin" <binbin.wu@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"hongyu.ning@linux.intel.com" <hongyu.ning@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, "Mehta, Sohil" <sohil.mehta@intel.com>, 
	"Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:40=E2=80=AFPM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Fri, 2026-08-28 at 15:18 -0700, Vishal Annapurve wrote:
> > > +
> > > +static int alloc_pamt_array(struct page **pamt_pages, struct tdx_pam=
t_cache
> > > *cache)
> > >   {
> > >          int i, j;
> > >
> > >          for (i =3D 0; i < TDX_DPAMT_ENTRY_PAGE_CNT; i++) {
> > > -               pamt_pages[i] =3D alloc_page(GFP_KERNEL_ACCOUNT);
> > > +               pamt_pages[i] =3D alloc_dpamt_page(cache);
> > >                  if (!pamt_pages[i])
> > >                          goto err;
> > >          }
> >
> > If the alloc_dpamt_page() was able to allocate a single page (not
> > two), should the partial allocation in the "err" handling return the
> > allocated page back to the cache?
>
> I think no? In the case of the cache not having sufficient pages, it is a=
 bug.
> And if things go wrong, I don't see a risk of big security issue. So opti=
mizing
> for more efficiently handling bug doesn't seem worth it.

Sounds good.

There is another allocation in tdx_pamt_get() that consumes the pages
from the dpamt page cache but returns memory back to the buddy
allocator. I think it's not particularly harmful, as the default
top-up should cover the maximum spt's in the fault path. But do you
have any additional thoughts on that?

>
> >
> > We observed similar failures internally with a slightly customized
> > setup which had retries for pamt cache allocations in the fault path
> > due to SEMCALL failures with older TDX module functionality.
>
> The best course of action is of course to fix the TDX module bug. I assum=
e this
> already happened. This is the default upstream approach for that kind of =
thing
> across both subsystems. But it sounds like this case is even more special=
,
> because handling the specific bug would involve other code that is missin=
g.
>
> That said, this code can definitely grow in the future if we seem some us=
er
> value for something. But can we please just call this basic version good =
enough,
> and build on it later?

Sounds reasonable.
