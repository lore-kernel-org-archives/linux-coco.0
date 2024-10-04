Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750951D5ADD
	for <linux-coco@lists.linux.dev>; Fri,  4 Oct 2024 01:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728004258; cv=none; b=Qy0mtcW3PErn1p/RmNqakfGTsCyFPdhogoVJVIOeMkYZxdkiVEKUwliJGFbNskDpELj4cc6o04z1x6mt4rJfQ4XYps1ir6qBQ2YPh+Lo9WFmrtuQyl5O5MVZ7dnyBoEpJPnRIm4RhnDgARLIRH/W1l6U0HizzPf0+eIUI00tqTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728004258; c=relaxed/simple;
	bh=DKYl+Zd7B7oC7ZrmvuSPytrwkdZZCy16uJdSWNpQYIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myOPQiPyMiKlr4ayrlCv7AmpsLhp1+oLqKhdSC6uARoCuHyiGxeEw60/evjjZm9vHUYzM7kjiSVojPhjBG0nLySyWxhxgcMTK/zlEs1Pj7wRdgrdUuboLrTrzXFujjmDTrwntiIZk7CD3tD4W38V1VfTzE7pXDZTh4SMd5gq01A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuKW+A9W; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuKW+A9W"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4a3075662b6so666535137.1
        for <linux-coco@lists.linux.dev>; Thu, 03 Oct 2024 18:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728004255; x=1728609055; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCX1gRvr7xgcko7ucEWBIV2dt5z8qvy1u1J14nEVaLo=;
        b=GuKW+A9WnDpdYRk9OZM0RGAvW2afViF1OISvT5xOVpd/C7h1AUS8T17eGQcR423WkL
         vDsg6m9StBakCRjCeqqjIk/eZMSYoxshQ6M3BvEdeEGZ+1QMcZDednuKYnZqcs+woQAU
         0PtTtK07hjdgj2jRUSHN5M3KtjpdtyPmob5iBUsCUk3foHvoor6ni5ze4u7vp6wrQP2q
         ey1xOpKZFIIFJn/OGVOGFRCSVBavydNJpqa4lhNeJytzSPVdEb68myrHoxo3S4sRRfaW
         YGJVsi/LB0uiRkx9KV0LAy95op8XrxqbpctPHvsKNsMyHWtMghcDaUbEHq/FSh8qujxp
         tKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728004255; x=1728609055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCX1gRvr7xgcko7ucEWBIV2dt5z8qvy1u1J14nEVaLo=;
        b=RqwguiRFsq7IGocZbyGRt6WetDJOUkGifzpgTCGqnxmMSLkKoucoWmJhl4F8VdTLs7
         P6PgD68we3DTNFk17swFB0jg5NeilHHcmRG9Epc+dVGQWArH5iNNgatPsW1H4j+ow3h4
         7ZY7lI9ZzVqPjCzxi0gVDvvCg+fCxZ+anPRBY3elhJWlRZoGIav5mEwWkVAgA0J9R3Ax
         rW3dn3fbIgQfo6b3nOk052cyykyuk3oWphZuOlHXuj4uQCS7P4MpkpSOG0fQgAE+8mxY
         TtN5Ox+m+ikYem5KCscTpWV/kRJ640Am3Kmd7bipyQSNGfi813epVmqvZLWdyUAkTA1/
         /Lhw==
X-Forwarded-Encrypted: i=1; AJvYcCX/JYNtAXL64SaYGHDsAbfkhtQWDYUG6KyARAc32hI/QbaJ05hroG0rFMR0rBkS5PAKCQg/D9/JDckJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5zATODlXG12NHmqcdriz001ZfDkBs4o2QodmUB3mZNLreFIYe
	F5k0N0h4C04mQExnwMOq6Ki4grGRxVWncL8ZX7QGPnbWAKEsTb9aWEhbKi6JA+266X19yszUANY
	n2v4UTR0vh5B1t5fTzbtNKwngRfk=
X-Google-Smtp-Source: AGHT+IFaWK8cjLqmy+brgL9rw0VETzbwyhgClzP1Who58XmUlLZIQHSDuRNkAHxpDBTlvdg1vsTA7xcx4JAg5HnW1GY=
X-Received: by 2002:a05:6102:38cb:b0:4a3:e05e:f6a3 with SMTP id
 ada2fe7eead31-4a405762235mr1317707137.3.1728004255235; Thu, 03 Oct 2024
 18:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930055112.344206-1-ying.huang@intel.com> <cf4a3ae4-deae-4224-88e3-308a55492085@redhat.com>
 <8734lgpuoi.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAHbLzkp_SyRBR+JsxMwM_qKpF=8+TU=36hDY6TuKMHdnLnyxAg@mail.gmail.com>
 <66ff297119b92_964f2294c6@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <66ff297119b92_964f2294c6@dwillia2-xfh.jf.intel.com.notmuch>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 3 Oct 2024 18:10:42 -0700
Message-ID: <CAHbLzkoR1pT1NEL7qAYi+JXOsB7O0FnHyHFOJ+4eZf9vf5K6Wg@mail.gmail.com>
Subject: Re: [PATCH] tdx, memory hotplug: Check whole hot-adding memory range
 for TDX
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Huang, Ying" <ying.huang@intel.com>, David Hildenbrand <david@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, x86@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 4:32=E2=80=AFPM Dan Williams <dan.j.williams@intel.c=
om> wrote:
>
> Yang Shi wrote:
> > On Mon, Sep 30, 2024 at 4:54=E2=80=AFPM Huang, Ying <ying.huang@intel.c=
om> wrote:
> > >
> > > Hi, David,
> > >
> > > Thanks a lot for comments!
> > >
> > > David Hildenbrand <david@redhat.com> writes:
> > >
> > > > On 30.09.24 07:51, Huang Ying wrote:
> > > >> On systems with TDX (Trust Domain eXtensions) enabled, memory rang=
es
> > > >> hot-added must be checked for compatibility by TDX.  This is curre=
ntly
> > > >> implemented through memory hotplug notifiers for each memory_block=
.
> > > >> If a memory range which isn't TDX compatible is hot-added, for
> > > >> example, some CXL memory, the command line as follows,
> > > >>    $ echo 1 > /sys/devices/system/node/nodeX/memoryY/online
> > > >> will report something like,
> > > >>    bash: echo: write error: Operation not permitted
> > > >> If pr_debug() is enabled, the error message like below will be sho=
wn
> > > >> in the kernel log,
> > > >>    online_pages [mem 0xXXXXXXXXXX-0xXXXXXXXXXX] failed
> > > >> Both are too general to root cause the problem.  This will confuse
> > > >> users.  One solution is to print some error messages in the TDX me=
mory
> > > >> hotplug notifier.  However, memory hotplug notifiers are called fo=
r
> > > >> each memory block, so this may lead to a large volume of messages =
in
> > > >> the kernel log if a large number of memory blocks are onlined with=
 a
> > > >> script or automatically.  For example, the typical size of memory
> > > >> block is 128MB on x86_64, when online 64GB CXL memory, 512 message=
s
> > > >> will be logged.
> > > >
> > > > ratelimiting would likely help here a lot, but I agree that it is
> > > > suboptimal.
> > > >
> > > >> Therefore, in this patch, the whole hot-adding memory range is
> > > >> checked
> > > >> for TDX compatibility through a newly added architecture specific
> > > >> function (arch_check_hotplug_memory_range()).  If rejected, the me=
mory
> > > >> hot-adding will be aborted with a proper kernel log message.  Whic=
h
> > > >> looks like something as below,
> > > >>    virt/tdx: Reject hot-adding memory range: 0xXXXXXXXX-0xXXXXXXXX
> > > >> for TDX compatibility.
> > > >> > The target use case is to support CXL memory on TDX enabled syst=
ems.
> > > >> If the CXL memory isn't compatible with TDX, the whole CXL memory
> > > >> range hot-adding will be rejected.  While the CXL memory can still=
 be
> > > >> used via devdax interface.
> > > >
> > > > I'm curious, why can that memory be used through devdax but not
> > > > through the buddy? I'm probably missing something important :)
> > >
> > > Because only TDX compatible memory can be used for TDX guest.  The bu=
ddy
> > > is used to allocate memory for TDX guest.  While devdax will not be u=
sed
> > > for that.
> >
> > Sorry for chiming in late. I think CXL also faces the similar problem
> > on the platform with MTE (memory tagging extension on ARM64). AFAIK,
> > we can't have MTE on CXL, so CXL has to stay as dax device if MTE is
> > enabled.
> >
> > We should need a similar mechanism to prevent users from hot-adding
> > CXL memory if MTE is on. But not like TDX I don't think we have a
> > simple way to tell whether the pfn belongs to CXL or not. Please
> > correct me if I'm wrong. I'm wondering whether we can find a more
> > common way to tell memory hotplug to not hot-add some region. For
> > example, a special flag in struct resource. off the top of my head.
> >
> > No solid idea yet, I'm definitely seeking some advice.
>
> Could the ARM version of arch_check_hotplug_memory_range() check if MTE
> is enabled in the CPU and then ask the CXL subsystem if the address range=
 is
> backed by a topology that supports MTE?

Kernel can tell whether MTE is really enabled. For the CXL part, IIUC
that relies on the CXL subsystem is able to tell whether that range
can support MTE or not, right? Or CXL subsystem tells us whether the
range is CXL memory range or not, then we can just refuse MTE for all
CXL regions for now. Does CXL support this now?

>
> However, why would it be ok to access CXL memory without MTE via devdax,
> but not as online page allocator memory?

CXL memory can be onlined as system ram as long as MTE is not enabled.
It just can be used as devdax device if MTE is enabled.

>
> If the goal is to simply deny any and all non-MTE supported CXL region
> from attaching then that could probably be handled as a modification to
> the "cxl_acpi" driver to deny region creation unless it supports
> everything the CPU expects from "memory".

I'm not quite familiar with the details in CXL driver. What did you
mean "deny region creation"? As long as the CXL memory still can be
used as devdax device, it should be fine.
