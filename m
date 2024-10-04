Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CA1E3767
	for <linux-coco@lists.linux.dev>; Fri,  4 Oct 2024 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728056779; cv=none; b=mv/HnZk//apNVLMARDR8ig6cyD5WZfiMVQ8kcJf1SpP85v+RPPkPhumsSwjq13psrdm62g4RdYUfB4AMM4ZUGajIlk89OeWoHCcKnv+TLbjHm5WsMndWnI5XT4j8CFbhGuDbRiW2c5Tdmaly6i+t7ZRHK8GcX7lxn0QFiyMrKnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728056779; c=relaxed/simple;
	bh=TxqTmzG53ZR8WZjqYYvjbmACKaa3Je3ObAiwIHTJ/F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAgSIaWT90SrN9Gnrfwn7crnl9/PpUkDLGMYcGuKpoNr2nW4tGrBw5pR8yXZpgpIj0YRBkozan9VVhvJ9sdRAhOzSDAkvMWaxa++ZtfPUzIAoxvRmTlaIGMMxPPeUYj1+Gy+tCX9mRyQodwabSzSgjcJlqmkF8G6wmrRgl3zOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+zXmrzh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+zXmrzh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so6045397a12.1
        for <linux-coco@lists.linux.dev>; Fri, 04 Oct 2024 08:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728056776; x=1728661576; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNNH+yI6KP3MLhT3Lv0mWixF93SS3ILelEwRHgMmM3w=;
        b=C+zXmrzhcVPF7grKnXXciBeFwHRuYeS5iS+D1tdOG3kRUtergbA3eXsrFYMSnNVGax
         RoFRf44XJh7RR+BdgGW2UXDezUYExAtxwV+bHWiZjEbuZx0w3pJoJLOyKWpi9If4QFdK
         Bb8sr3WM9HA96nqRCY8jrgokL23DCCue7i/Zn2tofofIVV/dTGwglC/FWyqZe9gEJ8Lk
         Qor1qExPliVMJCP/xDSNni1x/CPvKc+Q4yjGumjIlwMWcn6EU5nYsx+zOMddmb924L6I
         QBJe6VapGifq4WgmlC53SQUZxInmd8NeO5JH5Lj6SIkjO2bQlR1g5QHW6Jm+5K2pPG7N
         ySHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728056776; x=1728661576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNNH+yI6KP3MLhT3Lv0mWixF93SS3ILelEwRHgMmM3w=;
        b=lX1tZZMVi4kiD8YmdjknAKT3VMGLpTsdmrRkeeDjrCYoILIcSXd7jrjyCPlVdgQti4
         BXTQD7LErhC9r9FxdjZ/T8dZ8vnpmvvCMLYtPMyV6cvyYd5jMsa6Pe0Nxn429DPBoEL6
         y1vbLlnjzRGOYWB9LWD/LAfVtvzW1ZqhTVtcLyDDq25A+n57iV4h47zfxn3O+ns7jGVM
         8R7tTwjBKJ1fv0brkVRWLo5f5wmZhQpinbiXXr8FHEath6RQANjYwRGHRrwV0s+mkxA1
         f0qISgUGUFOIDQ99OUl9s6PDZ1E703zZ+qYSluRnyNdtIH4MOVPlK/KcZIB8VSz/oDSg
         ur/g==
X-Forwarded-Encrypted: i=1; AJvYcCXkQtmXtQyylyiQe1gerXl4PuqEr3Bx+uDfzbqT5NkqqG5qIoSIkGessz/Ex0iIUIvQgIPVWT4QVbmK@lists.linux.dev
X-Gm-Message-State: AOJu0YxmEJqeEWH/yt+KlJHsvutFGJKXSeYcArD9Ggu6n/fuMQJ8UCmt
	tOD/wPSwqqgHHmS33NWPmjv7avQ2/4miRNieVVSpsF4KOfMW0HJ35r09fk+xALHhB4wfj5SAzpq
	1jksutVTKVrx5aNBUaBj0RW036SU=
X-Google-Smtp-Source: AGHT+IElPuynvwCObKiBOuwsWFdMz9YTT/Oc+/+5k2c7nutYZ1ME/tf4FG80rW5FbnRUy2Gf1Tc2aFySux4xMBJtsm0=
X-Received: by 2002:a05:6402:510d:b0:5c8:81a6:f14c with SMTP id
 4fb4d7f45d1cf-5c8d2f3b9f3mr3741500a12.9.1728056775346; Fri, 04 Oct 2024
 08:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930055112.344206-1-ying.huang@intel.com> <cf4a3ae4-deae-4224-88e3-308a55492085@redhat.com>
 <8734lgpuoi.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAHbLzkp_SyRBR+JsxMwM_qKpF=8+TU=36hDY6TuKMHdnLnyxAg@mail.gmail.com>
 <66ff297119b92_964f2294c6@dwillia2-xfh.jf.intel.com.notmuch>
 <CAHbLzkoR1pT1NEL7qAYi+JXOsB7O0FnHyHFOJ+4eZf9vf5K6Wg@mail.gmail.com> <66ff5dd3b9128_964fe294ca@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <66ff5dd3b9128_964fe294ca@dwillia2-xfh.jf.intel.com.notmuch>
From: Yang Shi <shy828301@gmail.com>
Date: Fri, 4 Oct 2024 08:46:03 -0700
Message-ID: <CAHbLzkqBCfWOXEtafPnuQSj3B3OHGEPAxPs8ycDuX-a5aVgVjg@mail.gmail.com>
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

On Thu, Oct 3, 2024 at 8:15=E2=80=AFPM Dan Williams <dan.j.williams@intel.c=
om> wrote:
>
> Yang Shi wrote:
> > On Thu, Oct 3, 2024 at 4:32=E2=80=AFPM Dan Williams <dan.j.williams@int=
el.com> wrote:
> > >
> > > Yang Shi wrote:
> > > > On Mon, Sep 30, 2024 at 4:54=E2=80=AFPM Huang, Ying <ying.huang@int=
el.com> wrote:
> > > > >
> > > > > Hi, David,
> > > > >
> > > > > Thanks a lot for comments!
> > > > >
> > > > > David Hildenbrand <david@redhat.com> writes:
> > > > >
> > > > > > On 30.09.24 07:51, Huang Ying wrote:
> > > > > >> On systems with TDX (Trust Domain eXtensions) enabled, memory =
ranges
> > > > > >> hot-added must be checked for compatibility by TDX.  This is c=
urrently
> > > > > >> implemented through memory hotplug notifiers for each memory_b=
lock.
> > > > > >> If a memory range which isn't TDX compatible is hot-added, for
> > > > > >> example, some CXL memory, the command line as follows,
> > > > > >>    $ echo 1 > /sys/devices/system/node/nodeX/memoryY/online
> > > > > >> will report something like,
> > > > > >>    bash: echo: write error: Operation not permitted
> > > > > >> If pr_debug() is enabled, the error message like below will be=
 shown
> > > > > >> in the kernel log,
> > > > > >>    online_pages [mem 0xXXXXXXXXXX-0xXXXXXXXXXX] failed
> > > > > >> Both are too general to root cause the problem.  This will con=
fuse
> > > > > >> users.  One solution is to print some error messages in the TD=
X memory
> > > > > >> hotplug notifier.  However, memory hotplug notifiers are calle=
d for
> > > > > >> each memory block, so this may lead to a large volume of messa=
ges in
> > > > > >> the kernel log if a large number of memory blocks are onlined =
with a
> > > > > >> script or automatically.  For example, the typical size of mem=
ory
> > > > > >> block is 128MB on x86_64, when online 64GB CXL memory, 512 mes=
sages
> > > > > >> will be logged.
> > > > > >
> > > > > > ratelimiting would likely help here a lot, but I agree that it =
is
> > > > > > suboptimal.
> > > > > >
> > > > > >> Therefore, in this patch, the whole hot-adding memory range is
> > > > > >> checked
> > > > > >> for TDX compatibility through a newly added architecture speci=
fic
> > > > > >> function (arch_check_hotplug_memory_range()).  If rejected, th=
e memory
> > > > > >> hot-adding will be aborted with a proper kernel log message.  =
Which
> > > > > >> looks like something as below,
> > > > > >>    virt/tdx: Reject hot-adding memory range: 0xXXXXXXXX-0xXXXX=
XXXX
> > > > > >> for TDX compatibility.
> > > > > >> > The target use case is to support CXL memory on TDX enabled =
systems.
> > > > > >> If the CXL memory isn't compatible with TDX, the whole CXL mem=
ory
> > > > > >> range hot-adding will be rejected.  While the CXL memory can s=
till be
> > > > > >> used via devdax interface.
> > > > > >
> > > > > > I'm curious, why can that memory be used through devdax but not
> > > > > > through the buddy? I'm probably missing something important :)
> > > > >
> > > > > Because only TDX compatible memory can be used for TDX guest.  Th=
e buddy
> > > > > is used to allocate memory for TDX guest.  While devdax will not =
be used
> > > > > for that.
> > > >
> > > > Sorry for chiming in late. I think CXL also faces the similar probl=
em
> > > > on the platform with MTE (memory tagging extension on ARM64). AFAIK=
,
> > > > we can't have MTE on CXL, so CXL has to stay as dax device if MTE i=
s
> > > > enabled.
> > > >
> > > > We should need a similar mechanism to prevent users from hot-adding
> > > > CXL memory if MTE is on. But not like TDX I don't think we have a
> > > > simple way to tell whether the pfn belongs to CXL or not. Please
> > > > correct me if I'm wrong. I'm wondering whether we can find a more
> > > > common way to tell memory hotplug to not hot-add some region. For
> > > > example, a special flag in struct resource. off the top of my head.
> > > >
> > > > No solid idea yet, I'm definitely seeking some advice.
> > >
> > > Could the ARM version of arch_check_hotplug_memory_range() check if M=
TE
> > > is enabled in the CPU and then ask the CXL subsystem if the address r=
ange is
> > > backed by a topology that supports MTE?
> >
> > Kernel can tell whether MTE is really enabled. For the CXL part, IIUC
> > that relies on the CXL subsystem is able to tell whether that range
> > can support MTE or not, right? Or CXL subsystem tells us whether the
> > range is CXL memory range or not, then we can just refuse MTE for all
> > CXL regions for now. Does CXL support this now?
>
> So the CXL specification has section:
>
>     8.2.4.31 CXL Extended Metadata Capability Register
>
> ...that indicates if the device supports "Extended Metadata" (EMD).
> However, the CXL specification does not talk about how a given hosts
> uses the extended metadata capabilities of a device. That detail would
> need to come from an ARM platform specification.
>
> Currently CXL subsystem does nothing with this since there has been no
> need to date, but I would expect someone from the ARM side to plumb this
> detection into the CXL subsystem.

Yeah, it should be a good way to let the kernel know whether CXL
supports memory tagging or not.

>
> > > However, why would it be ok to access CXL memory without MTE via devd=
ax,
> > > but not as online page allocator memory?
> >
> > CXL memory can be onlined as system ram as long as MTE is not enabled.
> > It just can be used as devdax device if MTE is enabled.
>
> Do you mean the kernel only manages MTE for kernel pages, but with user
> mapped memory the application will need to implicitly know that
> memory-tagging is not available?

I think the current assumption is that all buddy memory (can be used
by userspace) should be taggable. And memory tagging is only supported
for anonymous mapping and tmpfs. I'm adding hugetlbfs support. But any
memory backed by the real backing store doesn't have memory tagging
support.

>
> I worry about applications that might not know that their heap is coming
> from a userspace memory allocator backed by device-dax rather than the
> kernel.

IIUC, memory mapping from device-dax is a file mapping, right? If so,
it is safe. If it is not, I think it is easy to handle. We can just
reject any VM_MTE mapping from DAX.

>
> > > If the goal is to simply deny any and all non-MTE supported CXL regio=
n
> > > from attaching then that could probably be handled as a modification =
to
> > > the "cxl_acpi" driver to deny region creation unless it supports
> > > everything the CPU expects from "memory".
> >
> > I'm not quite familiar with the details in CXL driver. What did you
> > mean "deny region creation"? As long as the CXL memory still can be
> > used as devdax device, it should be fine.
>
> Meaning that the CXL subsytem knows how to, for a given address range, fi=
gure
> out the members and geometry of the CXL devices that contribute to that
> range (CXL region). It would be straightforward to add EMD to that
> enumeration and flag the CXL region as not online-capable if the CPU has
> MTE enabled but no EMD capability.

It sounds like a good way to me.
