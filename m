Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1679E1CACED
	for <linux-coco@lists.linux.dev>; Fri,  4 Oct 2024 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728057305; cv=none; b=PdarazdGXCjBEssXrM+nsm7Coh3iuXTzj76ufrQqLe9nwh0mBTOHYxWiinXshlV4Y5Zlz2y6daVb+eh7wHt1eIscGC2eJecOSlH+ENlhhNL/CTCtb7xec/uYi2QKulIGoFEzqOfzAlmwL62BiTjaHreqKmeMuaz87RnQs38BMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728057305; c=relaxed/simple;
	bh=sPfDTTjfojdpTrD/m+6kDQhvCxIO2wR0hfTot8mv+q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyzpEyO6cHfEkSkV+rz/ar1ALWwhhDc1yIw5j0Rt8pE3/Flibas1WblGUuaCCDkCHabNrCr4nQO7EP6n9VA7/B2+SVq4rnXNIoTQ0JZcVK3ssCeZ55z/+pFbPfsAUsnClg4fD2ve+vg1du5mSV2S0Fyhe2oQ+6HkGv4HB9MCp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6QpEpun; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6QpEpun"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so295283466b.3
        for <linux-coco@lists.linux.dev>; Fri, 04 Oct 2024 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728057301; x=1728662101; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7V1eSqayAcR6DKSXIhi+T/ONIAgUgtsiQgcpv204+8=;
        b=E6QpEpunNCFX4uhHMllJ8sIoycWTxTtted9SEex/qWNEzQSdAjwwd4wPk+e5cbafyX
         n0rfvPrJkq1HSYmhNDF3H4umb/ILQCz0N43H2VSlbBSduDpjJqTwwzPvMCp1hIBDXc9f
         BOwLdD8HYbVBPuC0nkzsk5FMU137Cbf/rYbq8lAfahzyTN7XJvQOl/EB3Gu+H+XYVLCU
         RBhj+Xv06TEYPu7mkyhlSI9v11wCAzvh9SKHT1wjPm1KRkm9RyXzR5+/YMD4EB5TE+SS
         cY6OgO5f7MW176jbt2OVPCJIth0w+CE8QASM1nfpy6i1AWt52D3qZaJqZT3hUnqgGCP0
         f/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728057301; x=1728662101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7V1eSqayAcR6DKSXIhi+T/ONIAgUgtsiQgcpv204+8=;
        b=Pvy2I5sE61RbBLnGQir2+jm2wPMjSmTGiupBq6w5dBS8l49fzcU86BJt5HQ9192U2/
         Ot75khhr+PkzhxMG/7tYdsKl9cpXicUg8VeZKNv55WzAb2jL5OQzFjMEH+hG8RT8RvXd
         /xmEN4bIwFIWjrfQA1bCYqqPTlDuGWwpS5GF0Zut5YFmdE70KPvQZIMYX8Iex1R0bXeV
         RbX2rzuonYHw6/Y/AiycquPoUv/r0m7VQ60pDBUig2dRHabDtZBYMMHO8NlCiUJVa0m8
         c7BQzadG6s5iVtHe9xs+Y4RwBT++YJqFuFuuxHS5WHLcPVq/Sriw2j+dvCnI4vApSwe0
         Xt1A==
X-Forwarded-Encrypted: i=1; AJvYcCVqAurqofYrjO9mvqyJpQjyvnP6SsQXNzosT72CouyPuet+51hjsEuIgCV64zD8VEyuc0gvNyt5OdxD@lists.linux.dev
X-Gm-Message-State: AOJu0YzfGhADM9X/2ePGhhio9N01RsOtVNIYmQf+LVdUO6l7UkwdKcNv
	FebNrRHL+e0/4mIookoDBEGMl0EwkpgsYl/JjtskObs+gEYR9MHHw004viHHWrFikwH/nHUul9H
	4NvWpisizXA+eGY2AkynnK4vsA+A=
X-Google-Smtp-Source: AGHT+IFUeFMXgskl1sc4SyH/9JFwHHLkLn+Im1yAUtOBQWKw+t6O+BK082CGGJ19AYBEeFnE9FU2GY7KgsUCu9Ai3Gg=
X-Received: by 2002:a17:907:36c4:b0:a8d:1303:2283 with SMTP id
 a640c23a62f3a-a991bd7a123mr326684166b.30.1728057301051; Fri, 04 Oct 2024
 08:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930055112.344206-1-ying.huang@intel.com> <cf4a3ae4-deae-4224-88e3-308a55492085@redhat.com>
 <8734lgpuoi.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAHbLzkp_SyRBR+JsxMwM_qKpF=8+TU=36hDY6TuKMHdnLnyxAg@mail.gmail.com>
 <66ff297119b92_964f2294c6@dwillia2-xfh.jf.intel.com.notmuch>
 <CAHbLzkoR1pT1NEL7qAYi+JXOsB7O0FnHyHFOJ+4eZf9vf5K6Wg@mail.gmail.com>
 <66ff5dd3b9128_964fe294ca@dwillia2-xfh.jf.intel.com.notmuch> <22d1cfbf-b195-4343-b87b-493cb3d2843b@redhat.com>
In-Reply-To: <22d1cfbf-b195-4343-b87b-493cb3d2843b@redhat.com>
From: Yang Shi <shy828301@gmail.com>
Date: Fri, 4 Oct 2024 08:54:49 -0700
Message-ID: <CAHbLzkonbXG-=Ob3nfn=K0gqN1ow62SgwJegYORdCm-MfWeWhg@mail.gmail.com>
Subject: Re: [PATCH] tdx, memory hotplug: Check whole hot-adding memory range
 for TDX
To: David Hildenbrand <david@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, x86@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 3:21=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 04.10.24 05:15, Dan Williams wrote:
> > Yang Shi wrote:
> >> On Thu, Oct 3, 2024 at 4:32=E2=80=AFPM Dan Williams <dan.j.williams@in=
tel.com> wrote:
> >>>
> >>> Yang Shi wrote:
> >>>> On Mon, Sep 30, 2024 at 4:54=E2=80=AFPM Huang, Ying <ying.huang@inte=
l.com> wrote:
> >>>>>
> >>>>> Hi, David,
> >>>>>
> >>>>> Thanks a lot for comments!
> >>>>>
> >>>>> David Hildenbrand <david@redhat.com> writes:
> >>>>>
> >>>>>> On 30.09.24 07:51, Huang Ying wrote:
> >>>>>>> On systems with TDX (Trust Domain eXtensions) enabled, memory ran=
ges
> >>>>>>> hot-added must be checked for compatibility by TDX.  This is curr=
ently
> >>>>>>> implemented through memory hotplug notifiers for each memory_bloc=
k.
> >>>>>>> If a memory range which isn't TDX compatible is hot-added, for
> >>>>>>> example, some CXL memory, the command line as follows,
> >>>>>>>     $ echo 1 > /sys/devices/system/node/nodeX/memoryY/online
> >>>>>>> will report something like,
> >>>>>>>     bash: echo: write error: Operation not permitted
> >>>>>>> If pr_debug() is enabled, the error message like below will be sh=
own
> >>>>>>> in the kernel log,
> >>>>>>>     online_pages [mem 0xXXXXXXXXXX-0xXXXXXXXXXX] failed
> >>>>>>> Both are too general to root cause the problem.  This will confus=
e
> >>>>>>> users.  One solution is to print some error messages in the TDX m=
emory
> >>>>>>> hotplug notifier.  However, memory hotplug notifiers are called f=
or
> >>>>>>> each memory block, so this may lead to a large volume of messages=
 in
> >>>>>>> the kernel log if a large number of memory blocks are onlined wit=
h a
> >>>>>>> script or automatically.  For example, the typical size of memory
> >>>>>>> block is 128MB on x86_64, when online 64GB CXL memory, 512 messag=
es
> >>>>>>> will be logged.
> >>>>>>
> >>>>>> ratelimiting would likely help here a lot, but I agree that it is
> >>>>>> suboptimal.
> >>>>>>
> >>>>>>> Therefore, in this patch, the whole hot-adding memory range is
> >>>>>>> checked
> >>>>>>> for TDX compatibility through a newly added architecture specific
> >>>>>>> function (arch_check_hotplug_memory_range()).  If rejected, the m=
emory
> >>>>>>> hot-adding will be aborted with a proper kernel log message.  Whi=
ch
> >>>>>>> looks like something as below,
> >>>>>>>     virt/tdx: Reject hot-adding memory range: 0xXXXXXXXX-0xXXXXXX=
XX
> >>>>>>> for TDX compatibility.
> >>>>>>>> The target use case is to support CXL memory on TDX enabled syst=
ems.
> >>>>>>> If the CXL memory isn't compatible with TDX, the whole CXL memory
> >>>>>>> range hot-adding will be rejected.  While the CXL memory can stil=
l be
> >>>>>>> used via devdax interface.
> >>>>>>
> >>>>>> I'm curious, why can that memory be used through devdax but not
> >>>>>> through the buddy? I'm probably missing something important :)
> >>>>>
> >>>>> Because only TDX compatible memory can be used for TDX guest.  The =
buddy
> >>>>> is used to allocate memory for TDX guest.  While devdax will not be=
 used
> >>>>> for that.
> >>>>
> >>>> Sorry for chiming in late. I think CXL also faces the similar proble=
m
> >>>> on the platform with MTE (memory tagging extension on ARM64). AFAIK,
> >>>> we can't have MTE on CXL, so CXL has to stay as dax device if MTE is
> >>>> enabled.
> >>>>
> >>>> We should need a similar mechanism to prevent users from hot-adding
> >>>> CXL memory if MTE is on. But not like TDX I don't think we have a
> >>>> simple way to tell whether the pfn belongs to CXL or not. Please
> >>>> correct me if I'm wrong. I'm wondering whether we can find a more
> >>>> common way to tell memory hotplug to not hot-add some region. For
> >>>> example, a special flag in struct resource. off the top of my head.
> >>>>
> >>>> No solid idea yet, I'm definitely seeking some advice.
> >>>
> >>> Could the ARM version of arch_check_hotplug_memory_range() check if M=
TE
> >>> is enabled in the CPU and then ask the CXL subsystem if the address r=
ange is
> >>> backed by a topology that supports MTE?
> >>
> >> Kernel can tell whether MTE is really enabled. For the CXL part, IIUC
> >> that relies on the CXL subsystem is able to tell whether that range
> >> can support MTE or not, right? Or CXL subsystem tells us whether the
> >> range is CXL memory range or not, then we can just refuse MTE for all
> >> CXL regions for now. Does CXL support this now?
> >
> > So the CXL specification has section:
> >
> >      8.2.4.31 CXL Extended Metadata Capability Register
> >
> > ...that indicates if the device supports "Extended Metadata" (EMD).
> > However, the CXL specification does not talk about how a given hosts
> > uses the extended metadata capabilities of a device. That detail would
> > need to come from an ARM platform specification.
> >
> > Currently CXL subsystem does nothing with this since there has been no
> > need to date, but I would expect someone from the ARM side to plumb thi=
s
> > detection into the CXL subsystem.
> >
> >>> However, why would it be ok to access CXL memory without MTE via devd=
ax,
> >>> but not as online page allocator memory?
> >>
> >> CXL memory can be onlined as system ram as long as MTE is not enabled.
> >> It just can be used as devdax device if MTE is enabled.
> >
> > Do you mean the kernel only manages MTE for kernel pages, but with user
> > mapped memory the application will need to implicitly know that
> > memory-tagging is not available?
> >
> > I worry about applications that might not know that their heap is comin=
g
> > from a userspace memory allocator backed by device-dax rather than the
> > kernel.
>
> I recall that MTE is requested by user space via mprotect(). If we end
> up with memory that is not taggable, we would have to fail the
> operation, which is not desirable.
>
> This is what we want to avoid, so if MTE is enabled, all memory in the
> buddy should be taggable.

Yes, the buddy memory has to be taggable if MTE is enabled. And not
only mprotect(), but also mmap() and malloc() (glibc compiled with MTE
support) can allocate mapping with MTE. And MTE mapping is just
allowed for anonymous and tmpfs currently.

>
> >
> >>> If the goal is to simply deny any and all non-MTE supported CXL regio=
n
> >>> from attaching then that could probably be handled as a modification =
to
> >>> the "cxl_acpi" driver to deny region creation unless it supports
> >>> everything the CPU expects from "memory".
> >>
> >> I'm not quite familiar with the details in CXL driver. What did you
> >> mean "deny region creation"? As long as the CXL memory still can be
> >> used as devdax device, it should be fine.
> >
> > Meaning that the CXL subsytem knows how to, for a given address range, =
figure
> > out the members and geometry of the CXL devices that contribute to that
> > range (CXL region). It would be straightforward to add EMD to that
> > enumeration and flag the CXL region as not online-capable if the CPU ha=
s
> > MTE enabled but no EMD capability.
>
> If it's really just CXL memory we are worrying about, we could pass a
> flag to add_memory_driver_managed(), and passing that to our callback her=
e.
>
> Not sure if that is the most reliable way of handling it :) What about
> other ways of hotplugging memory besides CXL? Are we sure, they are/will
> be providing taggable memory?

AFAIK, I don't think they are, or at least some of them are not. So
this should be not CXL specific.

>
> --
> Cheers,
>
> David / dhildenb
>
