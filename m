Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F27C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 18:05:50 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id z13so5712459lfj.13
        for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=amHl1LwfBMa5KDjXqZHtC9+AbtdwaHnaESVYa8U2byA=;
        b=H3sKSrgk4dk9/Hswlf5QYJecr2rGepFCacSgMNlU5bXC/icuTUS4zFuhsYf8UFjjCl
         7/uIbmhnQiOjSjUOFuIuBSts3AMRMzgWX3yVxFfx3qaF3if0Z9wLFrEPzXxT6ROgcn0l
         gaMeTc9x99Xx1Wx+cZ9YaO54F8L5PBMeuY0cPogpowiUHI3o8nS6Q72kFDv3YskTyoW6
         ei3dsCuqyqMjnfD+uwcmzgj2yWMVDCsAxOUG/UsCydZsHdLxr7Pr0cfTobtEFm6CV0JK
         gWUVtOIWoX1tS164asj2tha1HSnVTDEw1BECD2k7dNu62R2ysxNEmQ41MUY+c/3LHM49
         C0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=amHl1LwfBMa5KDjXqZHtC9+AbtdwaHnaESVYa8U2byA=;
        b=tK6x7diztmSCwoBIsazK1TdOr9X5ZF8YG193A6+gFov5LW2vWtWqOa9zdSy7UJdexu
         rsGalV2Yckuiz/3uauo+mqTV/LJIgL/EOB+68ImOidtzs0rZWF+qIGwFKt+XzgJfN3VE
         W+LTZt6b8pzB/6Ft627+8dOL/PfAwU8LwYuPQdjrslG3AxMtHL2peOfKgdQNMBAhOHPA
         K4k2ZXth1Q6OnhYJenbN8ZpJCKcFDoGhj9ICCAhUVW81HVawrBi8AlL2KBLHXBi/WWc2
         65IijB5i/OMU587+z0PXgO0fs0ygPQBFBrk5bZSV9z77SnGkCaWtWG52/T+ePhBf6LWP
         HFAw==
X-Gm-Message-State: AJIora9FZsxiBiEoumKr8sl0OlGyo/HPSexh7RxM/mbOWUUP2Uh/UPEk
	dXK69HfRhzLfZtaLJ0cViqlxA0Kh8oXCd75bSj+5AQ==
X-Google-Smtp-Source: AGRyM1tQtvJ18kWM/znxc03I5G944GYbAvbUIXDCbDeZWIxGFl9h3QrIwEsXgHtgvQ25f40ZDrIp4mN4pcgMt5IV8i0=
X-Received: by 2002:a05:6512:a94:b0:47f:6621:cf2a with SMTP id
 m20-20020a0565120a9400b0047f6621cf2amr73823lfu.193.1656093948467; Fri, 24 Jun
 2022 11:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <CAMkAt6osbEGBFrgn=y1=x4mDHC1aL40BwaW0NdGHF8qmWd7ktA@mail.gmail.com> <20220624174057.72dwo7v36lokmoub@amd.com>
In-Reply-To: <20220624174057.72dwo7v36lokmoub@amd.com>
From: Peter Gonda <pgonda@google.com>
Date: Fri, 24 Jun 2022 12:05:36 -0600
Message-ID: <CAMkAt6oRv_X_af1tEdi0-eXUd23SekAkssHGo5h8f+8+KP8eHw@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Michael Roth <michael.roth@amd.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Dave Hansen <dave.hansen@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Marcelo <marcelo.cerri@canonical.com>, tim.gardner@canonical.com, 
	Khalid ElMously <khalid.elmously@canonical.com>, philip.cox@canonical.com, 
	"the arch/x86 maintainers" <x86@kernel.org>, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2022 at 11:41 AM Michael Roth <michael.roth@amd.com> wrote:
>
> On Fri, Jun 24, 2022 at 10:37:10AM -0600, Peter Gonda wrote:
> > On Tue, Jun 14, 2022 at 6:03 AM Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> > >
> > > UEFI Specification version 2.9 introduces the concept of memory
> > > acceptance: some Virtual Machine platforms, such as Intel TDX or AMD
> > > SEV-SNP, requiring memory to be accepted before it can be used by the
> > > guest. Accepting happens via a protocol specific for the Virtual
> > > Machine platform.
> > >
> > > Accepting memory is costly and it makes VMM allocate memory for the
> > > accepted guest physical address range. It's better to postpone memory
> > > acceptance until memory is needed. It lowers boot time and reduces
> > > memory overhead.
> > >
> > > The kernel needs to know what memory has been accepted. Firmware
> > > communicates this information via memory map: a new memory type --
> > > EFI_UNACCEPTED_MEMORY -- indicates such memory.
> > >
> > > Range-based tracking works fine for firmware, but it gets bulky for
> > > the kernel: e820 has to be modified on every page acceptance. It lead=
s
> > > to table fragmentation, but there's a limited number of entries in th=
e
> > > e820 table
> > >
> > > Another option is to mark such memory as usable in e820 and track if =
the
> > > range has been accepted in a bitmap. One bit in the bitmap represents
> > > 2MiB in the address space: one 4k page is enough to track 64GiB or
> > > physical address space.
> > >
> > > In the worst-case scenario -- a huge hole in the middle of the
> > > address space -- It needs 256MiB to handle 4PiB of the address
> > > space.
> > >
> > > Any unaccepted memory that is not aligned to 2M gets accepted upfront=
.
> > >
> > > The approach lowers boot time substantially. Boot to shell is ~2.5x
> > > faster for 4G TDX VM and ~4x faster for 64G.
> > >
> > > TDX-specific code isolated from the core of unaccepted memory support=
. It
> > > supposed to help to plug-in different implementation of unaccepted me=
mory
> > > such as SEV-SNP.
> > >
> > > The tree can be found here:
> > >
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Fintel%2Ftdx.git&amp;data=3D05%7C01%7Cmichael.roth%40amd.com%7C7=
3bacba017c84291482a08da55ffd481%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%=
7C637916854542432349%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DP%2FUJOL30=
5xo85NLXGxGouQVGHgzLJpmBdNyZ7Re5%2FB0%3D&amp;reserved=3D0 guest-unaccepted-=
memory
> >
> > Hi Kirill,
> >
> > I have a couple questions about this feature mainly about how cloud
> > customers can use this, I assume since this is a confidential compute
> > feature a large number of the users of these patches will be cloud
> > customers using TDX and SNP. One issue I see with these patches is how
> > do we as a cloud provider know whether a customer's linux image
> > supports this feature, if the image doesn't have these patches UEFI
> > needs to fully validate the memory, if the image does we can use this
> > new protocol. In GCE we supply our VMs with a version of the EDK2 FW
> > and the customer doesn't input into which UEFI we run, as far as I can
> > tell from the Azure SNP VM documentation it seems very similar. We
> > need to somehow tell our UEFI in the VM what to do based on the image.
> > The current way I can see to solve this issue would be to have our
> > customers give us metadata about their VM's image but this seems kinda
> > burdensome on our customers (I assume we'll have more features which
> > both UEFI and kernel need to both support inorder to be turned on like
> > this one) and error-prone, if a customer incorrectly labels their
>
> > image it may fail to boot.. Has there been any discussion about how to
> > solve this? My naive thoughts were what if UEFI and Kernel had some
> > sort of feature negotiation. Maybe that could happen via an extension
> > to exit boot services or a UEFI runtime driver, I'm not sure what's
> > best here just some ideas.
>
> Not sure if you've seen this thread or not, but there's also been some
> discussion around this in the context of the UEFI support:
>
>   https://patchew.org/EDK2/cover.1654420875.git.min.m.xu@intel.com/cce5ea=
2aaaeddd9ce9df6fa7ac1ef52976c5c7e6.1654420876.git.min.m.xu@intel.com/#20220=
608061805.vvsjiqt55rqnl3fw@sirius.home.kraxel.org
>
> 2 things being discussed there really, which I think roughly boil down
> to:
>
>  1) how to configure OVMF to enable/disable lazy acceptance
>     - compile time option most likely: accept-all/accept-minimum/accept-1=
GB
>
>  2) how to introduce an automatic mode in the future where OVMF does the
>     right thing based on what the guest supports. Gerd floated the idea o=
f
>     tying it to ExitBootServices as well, but not sure there's a solid
>     plan on what to do here yet.
>
> If that's accurate, it seems like the only 'safe' option is to disable it=
 via
> #1 (accept-all), and then when #2 comes along, compile OVMF to just Do Th=
e
> Right Thing.
>
> Users who know their VMs implement lazy acceptance can force it on via
> accept-all OVMF compile option.

Thanks for this Mike! I will bring this to the EDK2 community.

The issue for us is our users use a GCE built EDK2 not their own
compiled version so they don't have the choice. Reading the Azure docs
it seems the same for them, and for AWS so I don't know how often
customers actually get to bring their own firmware.

>
> -Mike
