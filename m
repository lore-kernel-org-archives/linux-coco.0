Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A985427707
	for <linux-coco@lists.linux.dev>; Sat, 24 Jan 2026 03:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769223631; cv=none; b=n/qEYXD95Pvz/Wk04PPCfwpYx6GV+dEeN9/blDDhLGBjAVrf6fUKtAHH/Ps+wd4BqgT82R+bicxIw9FPetNVtskhHEfEkW+EsHTdQwuB6iRVjR0aQvQRW7BolN1exYSYBvMyBt60vxP913gnFeFY2vMpkIJw/4MqPXIsYzufreQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769223631; c=relaxed/simple;
	bh=Ny9U0hrNZ1o/3g5fNjV+4s67PqEd3MAzQf5pUWLKUIQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HBWujeI3iTvgSMfzWg4RvufkAV28BZ1UaYj1qIg+wRykQYPPfiV9PvpWQtGmM7Baasna3kNVQdSxsKQz+8VWyKkpSv9qj0xITxLxryE+8HMMt24hPCkStYjkwjp3bJEO7ZcAx+EJocM8GqjNrYo1dbLL8I+NaZF43t/Fsq4sToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id F2D5792009C; Sat, 24 Jan 2026 04:00:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E896492009B;
	Sat, 24 Jan 2026 03:00:27 +0000 (GMT)
Date: Sat, 24 Jan 2026 03:00:27 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
    Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Kees Cook <kees@kernel.org>, 
    "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
    Nathan Chancellor <nathan@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
    Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, 
    linux-coco@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v1 12/14] x86/boot: tweak a20.c for better code
 generation
In-Reply-To: <20260121114911.6adc2838@pumpkin>
Message-ID: <alpine.DEB.2.21.2601240244460.6421@angie.orcam.me.uk>
References: <20260119192923.651588-1-hpa@zytor.com> <20260120195407.1163051-1-hpa@zytor.com> <20260120195407.1163051-13-hpa@zytor.com> <20260121114911.6adc2838@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Jan 2026, David Laight wrote:

> No loops needed.

 A loop is needed because there can be a considerable delay from issuing 
the I/O request to flip the A20 gate till the circuitry responding.  This 
is particularly true with the command issued to the 8042 device, which is 
a microcontroller running its own firmware that needs it time to process 
an incoming request to drive one of the microcontroller's GPIOs.  There 
was a reason for port 0x92 circuitry later added to the PC architecture 
with the IBM PS/2 being called the "fast A20 gate".

  Maciej
