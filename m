Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4622F26
	for <linux-coco@lists.linux.dev>; Wed,  2 Feb 2022 07:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5331AC340F3
	for <linux-coco@lists.linux.dev>; Wed,  2 Feb 2022 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643786537;
	bh=O+VeT6kS/QZzo+vk1G1yxaRHbOqFbZGg5og/oLWm1Fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P1wqBK4VLPcsSCCX8ADOp44iyouvWdXz3Ew9sma6j3G/dxv6boPNe/i6SSKicRJtf
	 uzS6MftbV++AvPa+LnY+MpKjkl62AthyLBJmqEiILZHPk2+0V3Ric8bETO3SOMTZ3z
	 at+vTaIPd2Pvw5O/+iPqUDdrpgXMP63Rgrq1WUPTaDqtXV9753C3Lb/BT8v7iyMk30
	 JeZTIqbX54vzX4H1eDvpsZLPftaICnpvcHlDlhm53rWS3K42WIAYKtIcwFnta8Q9Of
	 m5gu66nQgjWrSGAms9e8MiLCk4nVHFuEnd6iRqLF68nwmH3EtBn1royOupqMrugrwK
	 OIiS/rjOg4VcA==
Received: by mail-wr1-f51.google.com with SMTP id l25so36423536wrb.13
        for <linux-coco@lists.linux.dev>; Tue, 01 Feb 2022 23:22:17 -0800 (PST)
X-Gm-Message-State: AOAM5336Qvo4ZMLoxnlxouO4bekHXZOYF963JexODu7wVU1ErnAam4kU
	Za4T60ebRPHFPUSXiXjT80wMsnLyTp+sk+aWDTQ=
X-Google-Smtp-Source: ABdhPJx/DUF02WjEBxR5lO2KyQN3KE6QQwqhneznoWnTKv8K7TJm1sP/njFj9yvLe8O6wO1ZJvARMK7Seuogti1UW54=
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr24149922wrw.189.1643786535556;
 Tue, 01 Feb 2022 23:22:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com> <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com> <20220202071023.GA9489@srcf.ucam.org>
In-Reply-To: <20220202071023.GA9489@srcf.ucam.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 2 Feb 2022 08:22:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
Message-ID: <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, James Bottomley <jejb@linux.ibm.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, linux-efi <linux-efi@vger.kernel.org>, 
	Borislav Petkov <bp@suse.de>, Ashish Kalra <ashish.kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andi Kleen <ak@linux.intel.com>, Andrew Scull <ascull@google.com>, 
	Dave Hansen <dave.hansen@intel.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Lenny Szubowicz <lszubowi@redhat.com>, Peter Gonda <pgonda@google.com>, 
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>, 
	Daniele Buono <dbuono@linux.vnet.ibm.com>, linux-coco@lists.linux.dev, 
	linux-security-module@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	dougmill@linux.vnet.ibm.com, gcwilson@linux.ibm.com, gjoyce@ibm.com, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Feb 2022 at 08:10, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
>
> On Wed, Feb 02, 2022 at 08:05:23AM +0100, Greg KH wrote:
>
> > I see different platform patches trying to stick these blobs in
> > different locations and ways to access (securityfs, sysfs, char device
> > node), which seems crazy to me.  Why can't we at least pick one way to
> > access these to start with, and then have the filesystem layout be
> > platform-specific as needed, which will give the correct hints to
> > userspace as to what it needs to do here?
>
> Which other examples are you thinking of? I think this conversation may
> have accidentally become conflated with a different prior one and now
> we're talking at cross purposes.

This came up a while ago during review of one of the earlier revisions
of this patch set.

https://lore.kernel.org/linux-efi/YRZuIIVIzMfgjtEl@google.com/

which describes another two variations on the theme, for pKVM guests
as well as Android bare metal.
