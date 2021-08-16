Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233506D17
	for <linux-coco@lists.linux.dev>; Mon, 16 Aug 2021 09:57:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBF9261B72
	for <linux-coco@lists.linux.dev>; Mon, 16 Aug 2021 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629107831;
	bh=Ayb7keNQqIl6kxOV4S50AHDEDaPDNz8NyoQkVGazeso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t58Yn2UeXmWOB2wtL7wqLJfLyGH/OsS7N4yTo+ee9WMVhQ9pdFUiV6wlKEl//Ux0T
	 kjBxkY46Hv/mOYMVUzqctGvOSL9hTHJL+k+TVOosAIpJmA8A1WPbvoB+OhLeyTOdh/
	 q8FQWZR7FiozVjr+QOFR10Rh2uJ69P58eHw3W3XgflHhaIZX+HluQDJfJZrsrRv0Lf
	 aFCylpo58yKLOlqx/Yx8p3CXDA3YA+DhXUcRoiJ5Fm0y65X1+rG+xEc6TM/3oPGN9x
	 m2eAwunk2k/WBhzFP+YrZbSoMpofowUEekiJ/308uyZ/0lvFTP3Lx7Gx4/Qi8TRlWK
	 fPxudsQioxW9g==
Received: by mail-oi1-f171.google.com with SMTP id n27so1283824oij.0
        for <linux-coco@lists.linux.dev>; Mon, 16 Aug 2021 02:57:11 -0700 (PDT)
X-Gm-Message-State: AOAM532eCgUhMAA+o4STnxn9N+FV1OzpDv4yWhRJdHDzO+gwWbPcKRYA
	mPaMzYv+Nz/BJLfeFWZA2R5KedKAzxQlGCGx0Ik=
X-Google-Smtp-Source: ABdhPJwq0DGmPu6bRrra7HzEjbViggI2OAmDJO6gVCk0Z/NISDNWSOmmYJTNkEcfdQp0Pjzm18kxS5vbxkYHxJfY9lI=
X-Received: by 2002:aca:dd89:: with SMTP id u131mr11130913oig.47.1629107831145;
 Mon, 16 Aug 2021 02:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210809190157.279332-1-dovmurik@linux.ibm.com>
 <20210809190157.279332-4-dovmurik@linux.ibm.com> <YRZuIIVIzMfgjtEl@google.com>
In-Reply-To: <YRZuIIVIzMfgjtEl@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 16 Aug 2021 11:56:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFC-cizTw2Tv40uZHdLArKtdMNxdQXWoPWSL-8qexdkLQ@mail.gmail.com>
Message-ID: <CAMj1kXFC-cizTw2Tv40uZHdLArKtdMNxdQXWoPWSL-8qexdkLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] virt: Add sev_secret module to expose confidential
 computing secrets
To: Andrew Scull <ascull@google.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, linux-efi <linux-efi@vger.kernel.org>, 
	Borislav Petkov <bp@suse.de>, Ashish Kalra <ashish.kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andi Kleen <ak@linux.intel.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, James Bottomley <jejb@linux.ibm.com>, 
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>, linux-coco@lists.linux.dev, 
	linux-security-module@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Aug 2021 at 15:05, Andrew Scull <ascull@google.com> wrote:
>
> On Mon, Aug 09, 2021 at 07:01:57PM +0000, Dov Murik wrote:
> > The new sev_secret module exposes the confidential computing (coco)
> > secret area via securityfs interface.
> >
> > When the module is loaded (and securityfs is mounted, typically under
> > /sys/kernel/security), a "coco/sev_secret" directory is created in
> > securityfs.  In it, a file is created for each secret entry.  The name
> > of each such file is the GUID of the secret entry, and its content is
> > the secret data.
> >
> > This allows applications running in a confidential computing setting to
> > read secrets provided by the guest owner via a secure secret injection
> > mechanism (such as AMD SEV's LAUNCH_SECRET command).
> >
> > Removing (unlinking) files in the "coco/sev_secret" directory will zero
> > out the secret in memory, and remove the filesystem entry.  If the
> > module is removed and loaded again, that secret will not appear in the
> > filesystem.
>
> We've also been looking into a similar secret mechanism recently in the
> context of Android and protected KVM [1]. Our secrets would come from a
> different source, likely described as a reserved-memory node in the DT,
> but would need to be exposed to userspace in the same way as the SEV
> secrets. Originally I tried using a character device, but this approach
> with securityfs feels neater to me.
>

Agreed. I particularly like how deleting the file wipes the secret from memory.

> We're also looking to pass secrets from the bootloader to Linux, outside
> of any virtualization or confidential compute context (at least a far as
> I have understood the meaning of the term). Again, this feels like it
> would be exposed to userspace in the same way.
>

Indeed.

> It would be good to be able to share the parts that would be common. I
> expect that would mean the operations for a secret file and for a
> directory of secrets at a minimum. But it might also influence the paths
> in securityfs; I see, looking back, that the "coco" directory was added
> since the RFC but would a generalized "secret" subsystem make sense? Or
> would it be preferable for each case to define their own path?
>

I think we should avoid 'secret', to be honest. Even if protected KVM
is not riding the SEV/TDX wave, I think confidential computing is
still an accurate description of its semantics.

> [1] -- https://lwn.net/Articles/836693/
>
> > +static int sev_secret_unlink(struct inode *dir, struct dentry *dentry)
> > +{
> > +     struct sev_secret *s = sev_secret_get();
> > +     struct inode *inode = d_inode(dentry);
> > +     struct secret_entry *e = (struct secret_entry *)inode->i_private;
> > +     int i;
> > +
> > +     if (e) {
> > +             /* Zero out the secret data */
> > +             memzero_explicit(e->data, secret_entry_data_len(e));
>
> Would there be a benefit in flushing these zeros?
>

Do you mean cache clean+invalidate? Better to be precise here.


> > +             e->guid = NULL_GUID;
> > +     }
> > +
> > +     inode->i_private = NULL;
> > +
> > +     for (i = 0; i < SEV_SECRET_NUM_FILES; i++)
> > +             if (s->fs_files[i] == dentry)
> > +                     s->fs_files[i] = NULL;
> > +
> > +     /*
> > +      * securityfs_remove tries to lock the directory's inode, but we reach
> > +      * the unlink callback when it's already locked
> > +      */
> > +     inode_unlock(dir);
> > +     securityfs_remove(dentry);
> > +     inode_lock(dir);
> > +
> > +     return 0;
> > +}
