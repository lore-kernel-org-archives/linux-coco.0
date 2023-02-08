Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9D77474
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 18:58:52 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1675882724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2yKFS6Viy3139DIakekRtaZzazTkVRNSfEL5rzxk7wM=;
	b=Y03ESYUTYTvqCIzspqG1sCHXCEzog2RlUmNTD95gAb3aiZd7mz55vyLlMIc0kJTdAvcbYN
	qusK9RAkCEbFiqoL/N956d+1ih+j76bLBrnF1qHxdJexj6vu1p38ZITH8A9DtZaLEJTj01
	Hw8c4lvuu+Kk8EQJGHSUSq6k7nZUtwUWltxcTH0910G113TwNMrCQx+VpngdhyFsXpTxOY
	4gdFIcZ9YRU9FwM+E6WGX27ld4ARuQuMEjpGQJcFL3cTnf7YN/Hmb/yQzWjYywQddWy6cu
	uC7Bevzzg5lOTeamiEaFwZ0mC+SGwaPULnYF40SntqWqiMsp5xHuw4GK8LQIMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1675882724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2yKFS6Viy3139DIakekRtaZzazTkVRNSfEL5rzxk7wM=;
	b=0tJeQJ3ELSqqGR84rPFjtU9+1ryxiKFqPXF4Phr2uyWkczPPRe+RuaQrX3BHklfovaIP//
	AqTL772knETftgCQ==
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Christophe de Dinechin <dinechin@redhat.com>, "Reshetova, Elena"
 <elena.reshetova@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, Carlos Bilbao <carlos.bilbao@amd.com>,
 "Shishkin, Alexander" <alexander.shishkin@intel.com>, "Shutemov, Kirill"
 <kirill.shutemov@intel.com>, "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@intel.com>, "Kleen, Andi"
 <andi.kleen@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, Peter
 Zijlstra <peterz@infradead.org>, "Wunner, Lukas" <lukas.wunner@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Jason Wang
 <jasowang@redhat.com>, "Poimboe, Josh" <jpoimboe@redhat.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>, Cfir Cohen <cfir@google.com>,
 Marc Orr <marcorr@google.com>, "jbachmann@google.com"
 <jbachmann@google.com>, "pgonda@google.com" <pgonda@google.com>,
 "keescook@chromium.org" <keescook@chromium.org>, James Morris
 <jmorris@namei.org>, Michael Kelley <mikelley@microsoft.com>, "Lange, Jon"
 <jlange@microsoft.com>, "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: Linux guest kernel threat model for Confidential Computing
In-Reply-To: <Y+Pjv8CeDiLRxqP/@work-vm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <658272b5-9547-a69f-b6c9-a7ff2dd2d468@amd.com>
 <Y+HpmIesY96cYcWQ@kroah.com>
 <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com> <Y+MAPHZNLeBY13Pj@mit.edu>
 <20230208041913-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750D93CD9481F6AB78F1FB4E7D89@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y+OAZTljX1I6ZvR/@kroah.com> <m2edr03xh4.fsf@redhat.com>
 <Y+Pb4Ood56Wxn4sj@kroah.com> <Y+Pjv8CeDiLRxqP/@work-vm>
Date: Wed, 08 Feb 2023 19:58:43 +0100
Message-ID: <87bkm42dcs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 08 2023 at 18:02, David Alan Gilbert wrote:
> * Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
>> Anyway, you all are just spinning in circles now.  I'll just mute this
>> thread until I see an actual code change as it seems to be full of
>> people not actually sending anything we can actually do anything with.

There have been random patchs posted which finally caused this
discussion to start. Wrong order obviously :)

> I think the challenge will be to come up with non-intrusive, minimal
> changes;  obviously you don't want stuff shutgunned everywhere.

That has been tried by doing random surgery, e.g. caching some
particular PCI config value. While that might not look intrusive on the
first glance, these kind of punctual changes are the begin of a whack a
mole game and will end up in an uncoordinated maze of tiny mitigations
which make the code harder to maintain.

The real challenge is to come up with threat classes and mechanisms
which squash the whole class. Done right, e.g. caching a range of config
space values (or all of it) might give a benefit even for the bare metal
or general virtualization case.

That's quite some work, but its much more palatable than a trickle of
"fixes" when yet another source of trouble has been detected by a tool
or human inspection.

It's also more future proof because with the current approach of
scratching the itch of the day the probability that the just "mitigated"
issue comes back due to unrelated changes is very close to 100%.

It's not any different than any other threat class problem.

Thanks,

        tglx


