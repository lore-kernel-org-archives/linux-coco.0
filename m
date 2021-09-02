Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAD3FC1
	for <linux-coco@lists.linux.dev>; Thu,  2 Sep 2021 16:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B9FD611C9;
	Thu,  2 Sep 2021 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630598997;
	bh=/5UEuLAytnt5h7xW3EIC33ctR6wPCwVOZCQqcgqkvJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3huLCLOSmazG/5QL6tOukwBzqhEhmvrvweD5QX7WpGSb80FZTVji9JsXvpP/KJSM
	 27OHF5mWoJasjVO2lZXS5uK9+29vt9/0xHr7AwvYTVGNbUkHpONqeyausOkUWezMT9
	 ufKX6+ofNkXG5ymMspm81ZMB/qb9/U8PiQfJDAYU=
Date: Thu, 2 Sep 2021 18:09:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: James Bottomley <jejb@linux.ibm.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, linux-efi@vger.kernel.org,
	Borislav Petkov <bp@suse.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	Jim Cadden <jcadden@ibm.com>, linux-coco@lists.linux.dev,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Allow access to confidential computing secret area
 in SEV guests
Message-ID: <YTD3U70FCkXzNMrF@kroah.com>
References: <20210809190157.279332-1-dovmurik@linux.ibm.com>
 <YTDKUe8rXrr0Zika@kroah.com>
 <e6fb1d54605690cc1877d7140fc9346c22268111.camel@linux.ibm.com>
 <YTDoS5XycY3gO4MM@kroah.com>
 <6cb65cb3bd69ae69bde044f809525e478bdb8512.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cb65cb3bd69ae69bde044f809525e478bdb8512.camel@linux.ibm.com>

On Thu, Sep 02, 2021 at 08:19:51AM -0700, James Bottomley wrote:
> On Thu, 2021-09-02 at 17:05 +0200, Greg KH wrote:
> > On Thu, Sep 02, 2021 at 07:35:10AM -0700, James Bottomley wrote:
> > > On Thu, 2021-09-02 at 14:57 +0200, Greg KH wrote:
> > > [...]
> > > > Wait, why are you using securityfs for this?
> > > > 
> > > > securityfs is for LSMs to use. 
> > > 
> > > No it isn't ... at least not exclusively; we use it for non LSM
> > > security purposes as well, like for the TPM BIOS log and for
> > > IMA.  What makes you think we should start restricting securityfs
> > > to LSMs only?  That's not been the policy up to now.
> > 
> > Well that was the original intent of the filesystem when it was
> > created, but I guess it's really up to the LSM maintainers now what
> > they want it for.
> > 
> > > >  If you want your own filesystem to play around with stuff like
> > > > this, great, write your own, it's only 200 lines or less these
> > > > days.  We used to do it all the time until people realized they
> > > > should just use sysfs for driver stuff.
> > > 
> > > This is a security purpose (injected key retrieval), so securityfs
> > > seems to be the best choice.  It's certainly possible to create a
> > > new filesystem, but I really think things with a security purpose
> > > should use securityfs so people know where to look for them.
> > 
> > knowing where to look should not be an issue, as that should be
> > documented in Documentation/ABI/ anyway, right?
> > 
> > It's just the overlap / overreach of using an existing filesystem for
> > things that don't seem to be LSM-related that feels odd to me.
> > 
> > Why not just make a cocofs if those people want a filesystem
> > interface?
> > It's 200 lines or so these days, if not less, and that way you only
> > mount what you actually need for the system.
> 
> Secrets transfer is actually broader than confidential computing,
> although confidential computing is a first proposed use, so I think
> cocofs would be too narrow.
> 
> > Why force this into securityfs if it doesn't have to be?
> 
> It's not being forced.  Secrets transfer is a security function in the
> same way the bios log is.

Is the bios log in securityfs today?

Anyway, it's up to the securityfs maintainer (i.e. not me), but
personally, I think this should be a separate filesystem as that would
probably make things easier in the long run...

good luck!

greg k-h
