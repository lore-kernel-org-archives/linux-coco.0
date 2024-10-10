Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEB1CF28E
	for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728589623; cv=none; b=NrvLGXzEH0WMGV1yFhPlJw/AKtEaj32lxgsMgX1kM8TTll7fqm4MqcpUJP9biKBJN5jbvOQ5NWYolbPpscb+Ic/iel58tDZI0vjTEXvl32rrXTOFQeAZrFq0RCYSMeMVnH1Xax/xrZYqYo237f5RCdr46TneSqQNA4ilCHYgELU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728589623; c=relaxed/simple;
	bh=abZRVLo08LzcuZ1xEXrr2BDS8h/UhKg4KYKPrq+VaN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2UiKZaFjS3rS+wI1lNyduGMux958gQhBuZ87YQBiLNZtM428Ei/uReNqDs2KtNstZQfrl5uVUy04oT+a029iFV6hCE9XUoI0HFTg7IMuaHcCuH5/BjjHuadTSaQJ8UKG9XvxdP1TW35h4HUyNfCyT/hkSDE9k7lec5oMcuT87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frzy6IPa; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frzy6IPa"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a843bef98so177894266b.2
        for <linux-coco@lists.linux.dev>; Thu, 10 Oct 2024 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728589619; x=1729194419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3GM/QtSq57guYsRP0uD3zCreoGlMsZEA0FCnFpbyt4=;
        b=frzy6IPaKIpIzZ2U9xjZaYmcweN7sdc3J1QxXBcxVtCxIKD+JEPzroY8NY54CvFxkp
         BGDegkUAGbO3g9ijaNexVeylvzI0v4/K9RqfAguOP188+5VgkHBgnWi179qCXWWrw+NG
         xDmyhidFIpB8GUdSkTvDqKQdv32K9jWo/MMFjtBxxTe4viWRn4whzGViZ8ZPXA7Gldqn
         jDUwS3PX+FMeOLHSTKrJW6z7wSzWJf3oPo7SD+i57m4TgcC+wMB9RMiq/pbTe0nkqpZa
         YW4h1rolaW3JYWeqfh7R37HTb7cak/mVXObGdzAGa00lU5/NcDBsjgpZmni+m0WCRNE0
         oevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589619; x=1729194419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3GM/QtSq57guYsRP0uD3zCreoGlMsZEA0FCnFpbyt4=;
        b=nPQY5YkR+2wOrhLH7/v6wkj9dxD7J+5Rf2u6izUdnzNK7ZLUvPBMt312g740s2JFB3
         o9949EECBS0fj3r/ZA2D0ppi6dQCIMhTSFA/WiICXzbQmA3CgIWPlnirDoUw5Tjq0FbT
         pjxZcp9pmSxQz0/Dot5mZU9+T6VEK+16yDM/1rGrJy1D59Os5KLx/K5ndDRDfpw6qOCW
         MOgddwwpnZkZ/67G4+CRYd+d9xc6CYptgCp5ZF2J4QUs7b4+xaqp3/mjsgQeniK35ErP
         q5/0LevO4aDl5MD806JNQTS2BQAif6hwJAyd0xX2seo0bXnS9CAq/Nx+odTv7conkuHC
         +F+g==
X-Forwarded-Encrypted: i=1; AJvYcCUe1nBecoogIa04yQO2kZ4jA2kdPV5kytbF2bE8BgAXC/FXdcCoqgvJVlLCRE2HlCXaXtjtK0uyq9IH@lists.linux.dev
X-Gm-Message-State: AOJu0Yz42eBiXWRD9Mz7jrd65OXHASOEEJde5QryTurI33t9SRJnnQc/
	lOFR5nR/QjzLiJ44SNQew7ZnIfPdT5+8MKLu3ffcIBg50CNlyn/WS5sXWjMhgP3xD3S1woNbueE
	Z25NA4l4yhg8PUMGM691BzDQN8T8=
X-Google-Smtp-Source: AGHT+IESCWUKMq8YCkR8F/+RNuj2ueWl7s7OXeJ+V0ERay6XruNJRuq7g0SZobQ9AIbu8fC3uYMuMNWPqYH+sYrEEk8=
X-Received: by 2002:a17:906:6a01:b0:a99:76bc:dba0 with SMTP id
 a640c23a62f3a-a99b940ff3bmr11715366b.37.1728589619131; Thu, 10 Oct 2024
 12:46:59 -0700 (PDT)
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
 <66ff5dd3b9128_964fe294ca@dwillia2-xfh.jf.intel.com.notmuch>
 <CAHbLzkqBCfWOXEtafPnuQSj3B3OHGEPAxPs8ycDuX-a5aVgVjg@mail.gmail.com> <d84975b6-1c47-4290-92a3-a1dae180355a@arm.com>
In-Reply-To: <d84975b6-1c47-4290-92a3-a1dae180355a@arm.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 10 Oct 2024 12:46:47 -0700
Message-ID: <CAHbLzkrXRQcnFPUc+r81y9kbrUmxvkBWZT5gNFRDWLmjZ3fhog@mail.gmail.com>
Subject: Re: [PATCH] tdx, memory hotplug: Check whole hot-adding memory range
 for TDX
To: James Morse <james.morse@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>, "Huang, Ying" <ying.huang@intel.com>, 
	David Hildenbrand <david@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, x86@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:52=E2=80=AFAM James Morse <james.morse@arm.com> =
wrote:
>
> Hi guys,
>
> On 04/10/2024 16:46, Yang Shi wrote:
> > On Thu, Oct 3, 2024 at 8:15=E2=80=AFPM Dan Williams <dan.j.williams@int=
el.com> wrote:
> >> Yang Shi wrote:
> >>> On Thu, Oct 3, 2024 at 4:32=E2=80=AFPM Dan Williams <dan.j.williams@i=
ntel.com> wrote:
> >>>> Yang Shi wrote:
> >>>>> On Mon, Sep 30, 2024 at 4:54=E2=80=AFPM Huang, Ying <ying.huang@int=
el.com> wrote:
> >>>>>>
> >>>>>> Hi, David,
> >>>>>>
> >>>>>> Thanks a lot for comments!
> >>>>>>
> >>>>>> David Hildenbrand <david@redhat.com> writes:
> >>>>>>
> >>>>>>> On 30.09.24 07:51, Huang Ying wrote:
> >>>>>>>> On systems with TDX (Trust Domain eXtensions) enabled, memory ra=
nges
> >>>>>>>> hot-added must be checked for compatibility by TDX.  This is cur=
rently
> >>>>>>>> implemented through memory hotplug notifiers for each memory_blo=
ck.
> >>>>>>>> If a memory range which isn't TDX compatible is hot-added, for
> >>>>>>>> example, some CXL memory, the command line as follows,
> >>>>>>>>    $ echo 1 > /sys/devices/system/node/nodeX/memoryY/online
> >>>>>>>> will report something like,
> >>>>>>>>    bash: echo: write error: Operation not permitted
> >>>>>>>> If pr_debug() is enabled, the error message like below will be s=
hown
> >>>>>>>> in the kernel log,
> >>>>>>>>    online_pages [mem 0xXXXXXXXXXX-0xXXXXXXXXXX] failed
> >>>>>>>> Both are too general to root cause the problem.  This will confu=
se
> >>>>>>>> users.  One solution is to print some error messages in the TDX =
memory
> >>>>>>>> hotplug notifier.  However, memory hotplug notifiers are called =
for
> >>>>>>>> each memory block, so this may lead to a large volume of message=
s in
> >>>>>>>> the kernel log if a large number of memory blocks are onlined wi=
th a
> >>>>>>>> script or automatically.  For example, the typical size of memor=
y
> >>>>>>>> block is 128MB on x86_64, when online 64GB CXL memory, 512 messa=
ges
> >>>>>>>> will be logged.
> >>>>>>>
> >>>>>>> ratelimiting would likely help here a lot, but I agree that it is
> >>>>>>> suboptimal.
> >>>>>>>
> >>>>>>>> Therefore, in this patch, the whole hot-adding memory range is
> >>>>>>>> checked
> >>>>>>>> for TDX compatibility through a newly added architecture specifi=
c
> >>>>>>>> function (arch_check_hotplug_memory_range()).  If rejected, the =
memory
> >>>>>>>> hot-adding will be aborted with a proper kernel log message.  Wh=
ich
> >>>>>>>> looks like something as below,
> >>>>>>>>    virt/tdx: Reject hot-adding memory range: 0xXXXXXXXX-0xXXXXXX=
XX
> >>>>>>>> for TDX compatibility.
> >>>>>>>>> The target use case is to support CXL memory on TDX enabled sys=
tems.
> >>>>>>>> If the CXL memory isn't compatible with TDX, the whole CXL memor=
y
> >>>>>>>> range hot-adding will be rejected.  While the CXL memory can sti=
ll be
> >>>>>>>> used via devdax interface.
> >>>>>>>
> >>>>>>> I'm curious, why can that memory be used through devdax but not
> >>>>>>> through the buddy? I'm probably missing something important :)
> >>>>>>
> >>>>>> Because only TDX compatible memory can be used for TDX guest.  The=
 buddy
> >>>>>> is used to allocate memory for TDX guest.  While devdax will not b=
e used
> >>>>>> for that.
> >>>>>
> >>>>> Sorry for chiming in late. I think CXL also faces the similar probl=
em
> >>>>> on the platform with MTE (memory tagging extension on ARM64). AFAIK=
,
> >>>>> we can't have MTE on CXL, so CXL has to stay as dax device if MTE i=
s
> >>>>> enabled.
> >>>>>
> >>>>> We should need a similar mechanism to prevent users from hot-adding
> >>>>> CXL memory if MTE is on. But not like TDX I don't think we have a
> >>>>> simple way to tell whether the pfn belongs to CXL or not. Please
> >>>>> correct me if I'm wrong. I'm wondering whether we can find a more
> >>>>> common way to tell memory hotplug to not hot-add some region. For
> >>>>> example, a special flag in struct resource. off the top of my head.
> >>>>>
> >>>>> No solid idea yet, I'm definitely seeking some advice.
> >>>>
> >>>> Could the ARM version of arch_check_hotplug_memory_range() check if =
MTE
> >>>> is enabled in the CPU and then ask the CXL subsystem if the address =
range is
> >>>> backed by a topology that supports MTE?
> >>>
> >>> Kernel can tell whether MTE is really enabled. For the CXL part, IIUC
> >>> that relies on the CXL subsystem is able to tell whether that range
> >>> can support MTE or not, right? Or CXL subsystem tells us whether the
> >>> range is CXL memory range or not, then we can just refuse MTE for all
> >>> CXL regions for now. Does CXL support this now?
> >>
> >> So the CXL specification has section:
> >>
> >>     8.2.4.31 CXL Extended Metadata Capability Register
> >>
> >> ...that indicates if the device supports "Extended Metadata" (EMD).
> >> However, the CXL specification does not talk about how a given hosts
> >> uses the extended metadata capabilities of a device. That detail would
> >> need to come from an ARM platform specification.
> >>
> >> Currently CXL subsystem does nothing with this since there has been no
> >> need to date, but I would expect someone from the ARM side to plumb th=
is
> >> detection into the CXL subsystem.
> >
> > Yeah, it should be a good way to let the kernel know whether CXL
> > supports memory tagging or not.
>
> On its own I don't think its enough - there would need to be some kind of=
 capability in
> both the CXL root-port and the device to say that MTE tags are sent in th=
at metadata
> field. If both support it, then the device memory supports MTE.

OK, we need both root port and device support for MTE. IOW if either
of them is false, we know MTE can't be supported, so we won't online
CXL memory as system ram.

>
> (I'll poke the standards people to see if this is something they already =
have in the
>  works...)
>
>
> >>>> However, why would it be ok to access CXL memory without MTE via dev=
dax,
> >>>> but not as online page allocator memory?
>
> >>> CXL memory can be onlined as system ram as long as MTE is not enabled=
.
> >>> It just can be used as devdax device if MTE is enabled.
>
> This makes sense to me.
>
> We can print a warning that 'arm64.nomte' should be passed on the command=
 line if the CXL
> memory is more important than MTE and the hardware can't support both.

Sounds good to me.

>
>
> >> Do you mean the kernel only manages MTE for kernel pages, but with use=
r
> >> mapped memory the application will need to implicitly know that
> >> memory-tagging is not available?
> >
> > I think the current assumption is that all buddy memory (can be used
> > by userspace) should be taggable. And memory tagging is only supported
> > for anonymous mapping and tmpfs. I'm adding hugetlbfs support. But any
> > memory backed by the real backing store doesn't have memory tagging
> > support.
>
> Hopefully there are no assumptions here! -
> Documentation/arch/arm64/memory-tagging-extension.rst says anonymous mapp=
ings can have
> PROT_MTE set.
>
> The arch code requires all memory to support MTE if the CPUs support it.
>
>
> >> I worry about applications that might not know that their heap is comi=
ng
> >> from a userspace memory allocator backed by device-dax rather than the
> >> kernel.
> >
> > IIUC, memory mapping from device-dax is a file mapping, right? If so,
> > it is safe. If it is not, I think it is easy to handle. We can just
> > reject any VM_MTE mapping from DAX.
>
> That should already be the case. (we should check!)
>
> Because devdax is already a file-mapping, user-space can't expect MTE to =
work.
> While some library may not know the memory came from devdax - whoever wro=
te the
> malloc()/free() implementation will have known they were using devdax - t=
his is where the
> decisions to use MTE and what tag to use is made.
>
> I don't think this adds a new broken case.

I agree.

>
>
> >>>> If the goal is to simply deny any and all non-MTE supported CXL regi=
on
> >>>> from attaching then that could probably be handled as a modification=
 to
> >>>> the "cxl_acpi" driver to deny region creation unless it supports
> >>>> everything the CPU expects from "memory".
> >>>
> >>> I'm not quite familiar with the details in CXL driver. What did you
> >>> mean "deny region creation"? As long as the CXL memory still can be
> >>> used as devdax device, it should be fine.
> >>
> >> Meaning that the CXL subsytem knows how to, for a given address range,=
 figure
> >> out the members and geometry of the CXL devices that contribute to tha=
t
> >> range (CXL region). It would be straightforward to add EMD to that
> >> enumeration and flag the CXL region as not online-capable if the CPU h=
as
> >> MTE enabled but no EMD capability.
> >
> > It sounds like a good way to me.
>
> From your earlier description, EMD may not be enough - and this would dep=
end on the
> root-port (or at least the host side decoders) to support this too. I'll =
poke the spec
> people...

Thank you for following up.

>
>
> Thanks,
>
> James
