Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559579;
	b=1wFDSk/1UccnVhIVJU675n2ss7x8DasU5yn7XdaGbS1E53JbSLY0zuj7pmi+2sAlHLN7
	 J4P5cRI/7jZ2kGUQOJ/jrv47Xda4ElQ1iHutIxJktYkG4L+jZbo+HNkuVa6uqQQshG5UO
	 tIhOrre3jUnyI+3O6+MEam7arrCAlxhhMf9BdoxBhXjuflffrM7cbzdoFx0ZPv8DqCmTN
	 97/SoZ6GAurczRwdxBl4jMAQFhWo6zncmu04ithdiRaoXBf7RFE+mj7QCrAekNXKAn6T2
	 yU370ohOpE83nJSEVm8w1/5jz+vgMk/QnGrLju0siLxDBAOEnhc2JA/i5kyCl9ouTfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559579;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 X-HE-Tag:X-HE-Meta;
	bh=rKS7EROUAy7n7sobIAuUF7+6WoGtzT2rcSavJ4CCIuk=;
	b=RaRc527U1vfOFlIP8JgDroTxhq4LJqbyIpl1EdylLPFgsg5huZGyB8zgXbqpZiebvNwy
	 O6RiJkDNozIhEJZanq/a590jbTahp5hzjztLwOtyv/deRfkLgWTqQsOPuegL5fkV+oxI1
	 WZIOv5eZRpG8FrvUQCIqqrQCX3mDr+oEvnHCWn7i87P2x+iBBm2OzDybZ8x6IZ5iA/DNg
	 DpkdksCIo2mtD26w0xLPeLTnujuJnHNQDZRRT/OeJbzISViPvizkj06b2rEXOtqCQgKmb
	 yEJUHsLbxyyVwGM28k65+u3zDizItckObZ7FsVUITLv4Bh9KxOmNxCXFuolVQ0eOuwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35EA606A333
	for <linux-coco@lists.linux.dev>; Sun,  1 Nov 2026 18:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D35EA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 8EC03A0A95;
	Sun,  1 Nov 2026 18:59:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id CB7186000B;
	Sun,  1 Nov 2026 18:59:25 +0000 (UTC)
Message-ID: <44db8c930587810e902dcb36b5a0718a52eb94fc.camel@perches.com>
Subject: Re: [PATCH -v2] MAINTAINERS: Fix Intel TDX kernel file patterns
From: Joe Perches <joe@perches.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe	
 <rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Krzysztof Kozlowski	 <krzk@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, "biju.das.au"	 <biju.das.au@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org"	 <linux-serial@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org"	 <linux-renesas-soc@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,  "linux-coco@lists.linux.dev"	
 <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 Au Dang <au.dang.jx@renesas.com>
Date: Sun, 01 Nov 2026 10:59:24 -0800
In-Reply-To: <20261101185452.GAaueK_PzlK68DsmRz@fat_crate.local>
References: <20261028154743.GCauIZH3pZm24jCX9b@fat_crate.local>
	 <20261030023338.GGauQCAuYyXGwIhlqX@fat_crate.local>
	 <20261031030112.GHauVZ-OI2KjdkjrcY@fat_crate.local>
	 <35ba539820e1782bde038df98d3b49295eb7cd3a.camel@perches.com>
	 <20261031202741.GAauZPPfNDpQLSmIZD@fat_crate.local>
	 <94f0ab99b5c9072ce7c026672f704b2987db427f.camel@perches.com>
	 <20261031235958.GDauaA_pScrsk2xYUF@fat_crate.local>
	 <5ad69a1167fddc7caf1eb73e439765116db1ce17.camel@perches.com>
	 <20261101014710.GEauaaHoYk5TzRpGBQ@fat_crate.local>
	 <b700f0fb96b9454287850f7aa54d876b709cadb0.camel@perches.com>
	 <20261101185452.GAaueK_PzlK68DsmRz@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout06
X-Stat-Signature: j5g9rtxhq7odxsr3gt3d6798659r1mp8
X-Rspamd-Queue-Id: CB7186000B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19vCIaGkHorItTUazhptROnmHM9y+ZDxXw=
X-HE-Tag: 1793559565-30508
X-HE-Meta: U2FsdGVkX18XvreR4HU9/cED9LP6S0o8okYYC69f0b+TbxhNjW7lJ+E26iQGMtTTQ7KQNyqnwf5NpSWBV8UUuNV50fopKmNBiNSIRtQIzMIaRqXc6VtCCtE3unfuv144ILR8SMuZP76QPN3bBAzCgGTLxC6bIbAXbCivJJPE3Rv2zt7D4yniy5p6KvxbEmJXzW8uX9hGsxwIvvH3GjMF7Z0PgIgMXKgP7HvRMc0h+ntdfwt7kmAR30etnQaSWj7NH/TzbWqvDzK6/5Y1Q91qai8rJSHi48pNUaIX+LWOIDaZg2h3qA3AQh24c12kByeB

On Sun, 2026-11-01 at 10:54 -0800, Borislav Petkov wrote:
> On Sat, Oct 31, 2026 at 10:35:57PM -0700, Joe Perches wrote:
> > No.  The intent is to match typical file matching patterns.
>=20
> Are you trying to have the same matching behavior as <pathspec> of git?
>=20
> See section "pathspec" in gitglossary(7).

Not completely no.

I've no particular use in match '^:' in file patterns.

I think no maintainer would either.
